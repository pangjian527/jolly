package com.web.utils.suma;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.3.7
 * 2012-06-28T16:35:21.031+08:00
 * Generated source version: 2.3.7
 * 
 */
@WebService(targetNamespace = "http://tempuri.org/", name = "LinkWSSoap")
@XmlSeeAlso({ObjectFactory.class})
public interface LinkWSSoap {

    @WebResult(name = "ChargeUpMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "ChargeUpMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.ChargeUpMMS")
    @WebMethod(operationName = "ChargeUpMMS", action = "http://tempuri.org/ChargeUpMMS")
    @ResponseWrapper(localName = "ChargeUpMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.ChargeUpMMSResponse")
    public java.lang.String chargeUpMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "CardNo", targetNamespace = "http://tempuri.org/")
        java.lang.String cardNo,
        @WebParam(name = "CardPwd", targetNamespace = "http://tempuri.org/")
        java.lang.String cardPwd
    );

    @WebResult(name = "AgentMakeAccountResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "AgentMakeAccount", targetNamespace = "http://tempuri.org/", className = "shuma.com.AgentMakeAccount")
    @WebMethod(operationName = "AgentMakeAccount", action = "http://tempuri.org/AgentMakeAccount")
    @ResponseWrapper(localName = "AgentMakeAccountResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.AgentMakeAccountResponse")
    public java.lang.String agentMakeAccount(
        @WebParam(name = "LoginName", targetNamespace = "http://tempuri.org/")
        java.lang.String loginName,
        @WebParam(name = "LoginPwd", targetNamespace = "http://tempuri.org/")
        java.lang.String loginPwd,
        @WebParam(name = "CorpName", targetNamespace = "http://tempuri.org/")
        java.lang.String corpName,
        @WebParam(name = "LinkMan", targetNamespace = "http://tempuri.org/")
        java.lang.String linkMan,
        @WebParam(name = "Tel", targetNamespace = "http://tempuri.org/")
        java.lang.String tel,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Email", targetNamespace = "http://tempuri.org/")
        java.lang.String email,
        @WebParam(name = "Memo", targetNamespace = "http://tempuri.org/")
        java.lang.String memo,
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pass", targetNamespace = "http://tempuri.org/")
        java.lang.String pass
    );

    @WebResult(name = "HelloWorldResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "HelloWorld", targetNamespace = "http://tempuri.org/", className = "shuma.com.HelloWorld")
    @WebMethod(operationName = "HelloWorld", action = "http://tempuri.org/HelloWorld")
    @ResponseWrapper(localName = "HelloWorldResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.HelloWorldResponse")
    public java.lang.String helloWorld();

    @WebResult(name = "GetReportFailResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetReportFail", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportFail")
    @WebMethod(operationName = "GetReportFail", action = "http://tempuri.org/GetReportFail")
    @ResponseWrapper(localName = "GetReportFailResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportFailResponse")
    public java.lang.String getReportFail(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "cell", targetNamespace = "http://tempuri.org/")
        java.lang.String cell
    );

    @WebResult(name = "GetMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetMMS")
    @WebMethod(operationName = "GetMMS", action = "http://tempuri.org/GetMMS")
    @ResponseWrapper(localName = "GetMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetMMSResponse")
    public java.lang.String getMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "AgentChangeAccountResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "AgentChangeAccount", targetNamespace = "http://tempuri.org/", className = "shuma.com.AgentChangeAccount")
    @WebMethod(operationName = "AgentChangeAccount", action = "http://tempuri.org/AgentChangeAccount")
    @ResponseWrapper(localName = "AgentChangeAccountResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.AgentChangeAccountResponse")
    public java.lang.String agentChangeAccount(
        @WebParam(name = "LoginName", targetNamespace = "http://tempuri.org/")
        java.lang.String loginName,
        @WebParam(name = "LoginPwd", targetNamespace = "http://tempuri.org/")
        java.lang.String loginPwd,
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "SmsBalance", targetNamespace = "http://tempuri.org/")
        int smsBalance,
        @WebParam(name = "MmsBalance", targetNamespace = "http://tempuri.org/")
        int mmsBalance
    );

    @WebResult(name = "ChargeUpResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "ChargeUp", targetNamespace = "http://tempuri.org/", className = "shuma.com.ChargeUp")
    @WebMethod(operationName = "ChargeUp", action = "http://tempuri.org/ChargeUp")
    @ResponseWrapper(localName = "ChargeUpResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.ChargeUpResponse")
    public int chargeUp(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "CardNo", targetNamespace = "http://tempuri.org/")
        java.lang.String cardNo,
        @WebParam(name = "CardPwd", targetNamespace = "http://tempuri.org/")
        java.lang.String cardPwd
    );

    @WebResult(name = "RegResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "Reg", targetNamespace = "http://tempuri.org/", className = "shuma.com.Reg")
    @WebMethod(operationName = "Reg", action = "http://tempuri.org/Reg")
    @ResponseWrapper(localName = "RegResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.RegResponse")
    public int reg(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "CorpName", targetNamespace = "http://tempuri.org/")
        java.lang.String corpName,
        @WebParam(name = "LinkMan", targetNamespace = "http://tempuri.org/")
        java.lang.String linkMan,
        @WebParam(name = "Tel", targetNamespace = "http://tempuri.org/")
        java.lang.String tel,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Email", targetNamespace = "http://tempuri.org/")
        java.lang.String email,
        @WebParam(name = "Memo", targetNamespace = "http://tempuri.org/")
        java.lang.String memo
    );

    @WebResult(name = "UpdPwdResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "UpdPwd", targetNamespace = "http://tempuri.org/", className = "shuma.com.UpdPwd")
    @WebMethod(operationName = "UpdPwd", action = "http://tempuri.org/UpdPwd")
    @ResponseWrapper(localName = "UpdPwdResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.UpdPwdResponse")
    public int updPwd(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "NewPwd", targetNamespace = "http://tempuri.org/")
        java.lang.String newPwd
    );

    @WebResult(name = "UnRegResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "UnReg", targetNamespace = "http://tempuri.org/", className = "shuma.com.UnReg")
    @WebMethod(operationName = "UnReg", action = "http://tempuri.org/UnReg")
    @ResponseWrapper(localName = "UnRegResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.UnRegResponse")
    public int unReg(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "GetReportSMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetReportSMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportSMS")
    @WebMethod(operationName = "GetReportSMS", action = "http://tempuri.org/GetReportSMS")
    @ResponseWrapper(localName = "GetReportSMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportSMSResponse")
    public java.lang.String getReportSMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "SendMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "SendMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.SendMMS")
    @WebMethod(operationName = "SendMMS", action = "http://tempuri.org/SendMMS")
    @ResponseWrapper(localName = "SendMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.SendMMSResponse")
    public java.lang.String sendMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Base64Content", targetNamespace = "http://tempuri.org/")
        java.lang.String base64Content,
        @WebParam(name = "Title", targetNamespace = "http://tempuri.org/")
        java.lang.String title,
        @WebParam(name = "ExtCode", targetNamespace = "http://tempuri.org/")
        java.lang.String extCode,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "SendResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "Send", targetNamespace = "http://tempuri.org/", className = "shuma.com.Send")
    @WebMethod(operationName = "Send", action = "http://tempuri.org/Send")
    @ResponseWrapper(localName = "SendResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.SendResponse")
    public int send(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Content", targetNamespace = "http://tempuri.org/")
        java.lang.String content,
        @WebParam(name = "Cell", targetNamespace = "http://tempuri.org/")
        java.lang.String cell,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "Send2Result", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "Send2", targetNamespace = "http://tempuri.org/", className = "shuma.com.Send2")
    @WebMethod(operationName = "Send2", action = "http://tempuri.org/Send2")
    @ResponseWrapper(localName = "Send2Response", targetNamespace = "http://tempuri.org/", className = "shuma.com.Send2Response")
    public java.lang.String send2(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Content", targetNamespace = "http://tempuri.org/")
        java.lang.String content,
        @WebParam(name = "Cell", targetNamespace = "http://tempuri.org/")
        java.lang.String cell,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "BatchSendMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "BatchSendMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSendMMS")
    @WebMethod(operationName = "BatchSendMMS", action = "http://tempuri.org/BatchSendMMS")
    @ResponseWrapper(localName = "BatchSendMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSendMMSResponse")
    public java.lang.String batchSendMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobiles", targetNamespace = "http://tempuri.org/")
        java.lang.String mobiles,
        @WebParam(name = "Base64Content", targetNamespace = "http://tempuri.org/")
        java.lang.String base64Content,
        @WebParam(name = "Title", targetNamespace = "http://tempuri.org/")
        java.lang.String title,
        @WebParam(name = "ExtCode", targetNamespace = "http://tempuri.org/")
        java.lang.String extCode,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "SendMMS2Result", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "SendMMS2", targetNamespace = "http://tempuri.org/", className = "shuma.com.SendMMS2")
    @WebMethod(operationName = "SendMMS2", action = "http://tempuri.org/SendMMS2")
    @ResponseWrapper(localName = "SendMMS2Response", targetNamespace = "http://tempuri.org/", className = "shuma.com.SendMMS2Response")
    public java.lang.String sendMMS2(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Base64Content", targetNamespace = "http://tempuri.org/")
        java.lang.String base64Content,
        @WebParam(name = "Title", targetNamespace = "http://tempuri.org/")
        java.lang.String title,
        @WebParam(name = "ExtCode", targetNamespace = "http://tempuri.org/")
        java.lang.String extCode,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "BalanceMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "BalanceMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.BalanceMMS")
    @WebMethod(operationName = "BalanceMMS", action = "http://tempuri.org/BalanceMMS")
    @ResponseWrapper(localName = "BalanceMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.BalanceMMSResponse")
    public java.lang.String balanceMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "BatchSendResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "BatchSend", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSend")
    @WebMethod(operationName = "BatchSend", action = "http://tempuri.org/BatchSend")
    @ResponseWrapper(localName = "BatchSendResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSendResponse")
    public int batchSend(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Content", targetNamespace = "http://tempuri.org/")
        java.lang.String content,
        @WebParam(name = "Cell", targetNamespace = "http://tempuri.org/")
        java.lang.String cell,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "BatchSendMMS2Result", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "BatchSendMMS2", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSendMMS2")
    @WebMethod(operationName = "BatchSendMMS2", action = "http://tempuri.org/BatchSendMMS2")
    @ResponseWrapper(localName = "BatchSendMMS2Response", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSendMMS2Response")
    public java.lang.String batchSendMMS2(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobiles", targetNamespace = "http://tempuri.org/")
        java.lang.String mobiles,
        @WebParam(name = "Base64Content", targetNamespace = "http://tempuri.org/")
        java.lang.String base64Content,
        @WebParam(name = "Title", targetNamespace = "http://tempuri.org/")
        java.lang.String title,
        @WebParam(name = "ExtCode", targetNamespace = "http://tempuri.org/")
        java.lang.String extCode,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "SelSumResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "SelSum", targetNamespace = "http://tempuri.org/", className = "shuma.com.SelSum")
    @WebMethod(operationName = "SelSum", action = "http://tempuri.org/SelSum")
    @ResponseWrapper(localName = "SelSumResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.SelSumResponse")
    public int selSum(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "GetReportMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetReportMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportMMS")
    @WebMethod(operationName = "GetReportMMS", action = "http://tempuri.org/GetReportMMS")
    @ResponseWrapper(localName = "GetReportMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportMMSResponse")
    public java.lang.String getReportMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "UpdRegResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "UpdReg", targetNamespace = "http://tempuri.org/", className = "shuma.com.UpdReg")
    @WebMethod(operationName = "UpdReg", action = "http://tempuri.org/UpdReg")
    @ResponseWrapper(localName = "UpdRegResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.UpdRegResponse")
    public int updReg(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "CorpName", targetNamespace = "http://tempuri.org/")
        java.lang.String corpName,
        @WebParam(name = "LinkMan", targetNamespace = "http://tempuri.org/")
        java.lang.String linkMan,
        @WebParam(name = "Tel", targetNamespace = "http://tempuri.org/")
        java.lang.String tel,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Email", targetNamespace = "http://tempuri.org/")
        java.lang.String email,
        @WebParam(name = "Memo", targetNamespace = "http://tempuri.org/")
        java.lang.String memo
    );

    @WebResult(name = "GetReportFailMMSResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetReportFailMMS", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportFailMMS")
    @WebMethod(operationName = "GetReportFailMMS", action = "http://tempuri.org/GetReportFailMMS")
    @ResponseWrapper(localName = "GetReportFailMMSResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetReportFailMMSResponse")
    public java.lang.String getReportFailMMS(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "cell", targetNamespace = "http://tempuri.org/")
        java.lang.String cell
    );

    @WebResult(name = "BatchSend2Result", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "BatchSend2", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSend2")
    @WebMethod(operationName = "BatchSend2", action = "http://tempuri.org/BatchSend2")
    @ResponseWrapper(localName = "BatchSend2Response", targetNamespace = "http://tempuri.org/", className = "shuma.com.BatchSend2Response")
    public java.lang.String batchSend2(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "Mobile", targetNamespace = "http://tempuri.org/")
        java.lang.String mobile,
        @WebParam(name = "Content", targetNamespace = "http://tempuri.org/")
        java.lang.String content,
        @WebParam(name = "Cell", targetNamespace = "http://tempuri.org/")
        java.lang.String cell,
        @WebParam(name = "SendTime", targetNamespace = "http://tempuri.org/")
        java.lang.String sendTime
    );

    @WebResult(name = "GetResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "Get", targetNamespace = "http://tempuri.org/", className = "shuma.com.Get")
    @WebMethod(operationName = "Get", action = "http://tempuri.org/Get")
    @ResponseWrapper(localName = "GetResponse", targetNamespace = "http://tempuri.org/", className = "shuma.com.GetResponse")
    public java.lang.String get(
        @WebParam(name = "CorpID", targetNamespace = "http://tempuri.org/")
        java.lang.String corpID,
        @WebParam(name = "Pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );
}