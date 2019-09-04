package com.hughjin.core.exception;

public class RedisException extends Exception {

    private static final long serialVersionUID = 3207977226275185578L;
    /**
     * 异常信息描述
     */
    private String msg;

    /**
     * 错误日志(供分析查看使用)
     */
    private String errorMsg;

    /**
     * 异常编码
     */
    private String errCode = "E001";

    public RedisException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public RedisException(String errcode, String msg) {
        super(errcode + " : " + msg);
        this.msg = msg;
        this.errorMsg = msg;
        this.errCode = errcode;
    }

    public RedisException(String errcode, String msg, String errorMsg) {
        super(errcode + " : " + errorMsg);
        this.errorMsg = errorMsg;
        this.msg = msg;
        this.errCode = errcode;
    }

    public RedisException(String msg, Throwable throwable) {
        super(msg, throwable);
        this.msg = msg;
    }

    public RedisException(Throwable throwable) {
        super(throwable);
    }

    public String getMsg() {
        return msg;
    }

    public String getErrCode() {
        return errCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
