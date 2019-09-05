package com.hughjin.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * 测试rmi
 */
public interface IHelloRMI extends Remote {
    public String sayHelloToSomeBody(String someBodyName) throws RemoteException;
}
