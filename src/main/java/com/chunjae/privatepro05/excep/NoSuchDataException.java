package com.chunjae.privatepro05.excep;

public class NoSuchDataException extends RuntimeException {
    public NoSuchDataException(String message){
        super(message);
    }
    /*
    userList : 테이블이 비어있다면, 빈 리스트 반환
    userDetail : 일치하는 데이터가 없으면 null로 반환
    userUpdate : update 된 데이터가 없으면, 0 반환
    userDelete : delete 된 데이터가 없으면, 0 반환
    userInsert : insert 된 데이터가 없으면, 0 반환
     */
}
