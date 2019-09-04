package com.hughjin.rmi.impl;

import com.hughjin.rmi.IHelloRMI;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class HelloRMIImpl extends UnicastRemoteObject implements IHelloRMI {
    public HelloRMIImpl() throws RemoteException {
        super();
    }

    public String sayHelloToSomeBody(String someBodyName) throws RemoteException {
        System.out.println("Connected sucessfully!");
        return "你好，" + someBodyName + "!";
    }
}