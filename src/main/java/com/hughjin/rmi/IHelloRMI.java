package com.hughjin.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IHelloRMI extends Remote {
    public String sayHelloToSomeBody(String someBodyName) throws RemoteException;
}
