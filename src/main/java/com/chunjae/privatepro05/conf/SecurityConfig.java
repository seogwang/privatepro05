package com.chunjae.privatepro05.conf;

import com.chunjae.privatepro05.biz.UserService;
import com.chunjae.privatepro05.biz.UserServiceImpl;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

//스프링시큐리티 설정 관리자
@Configuration
public class SecurityConfig {
    @Bean
    public UserService userService() { return new UserServiceImpl(); }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() { return new BCryptPasswordEncoder(); }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // 권한에 따라 허용하는 url설정
        // .antMachers는 /login, /join 페이지는 모두 허용, 다른 페이지는 인증된 사용자만 허용
        // 자원의 경로는 mvcMatchers로
        http
                .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/login","/join","/idCheck","emailCheck", "/joinPro").permitAll()
                .mvcMatchers("/","/resource/**","/css/**","/js/**","/images/**").permitAll()
                .anyRequest().authenticated();

        //logout 설정
        http
                .logout()
                .logoutUrl("/logout")
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/"); // logout에 성공하면 /로 redirect

        //cors 방지 해제
        http.csrf().disable().cors().disable();

        //중복 로그인 방지
        http.sessionManagement()
                .sessionFixation().changeSessionId()
                .maximumSessions(1)
                .expiredSessionStrategy(new CustomSessionExpiredStrategy())
                .maxSessionsPreventsLogin(false)
                .sessionRegistry(sessionRegistry());

        return http.build();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("*"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }

    @Bean
    public static ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventpublisher() {
        return new ServletListenerRegistrationBean<>( new HttpSessionEventPublisher() );
    }
}
