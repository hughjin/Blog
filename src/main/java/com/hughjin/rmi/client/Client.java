package com.hughjin.rmi.client;

import com.hughjin.rmi.IHelloRMI;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class Client {
    public static void main(String args[]) {
        try {
            // 填写服务器ip
            IHelloRMI rhello = (IHelloRMI) Naming.lookup("rmi://127.0.0.1:8888/RHello");
            System.out.println(rhello.sayHelloToSomeBody(String.valueOf(System.currentTimeMillis())));
        } catch (NotBoundException | MalformedURLException | RemoteException e) {
            e.printStackTrace();
        }
    }
}