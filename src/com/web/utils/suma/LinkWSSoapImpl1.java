
/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

package com.web.utils.suma;

import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.3.7
 * 2012-06-28T16:35:21+08:00
 * Generated source version: 2.3.7
 * 
 */

@javax.jws.WebService(
                      serviceName = "LinkWS",
                      portName = "LinkWSSoap12",
                      targetNamespace = "http://tempuri.org/",
                      wsdlLocation = "http://120.132.132.133/WS/LinkWS.asmx?wsdl",
                      endpointInterface = "shuma.com.LinkWSSoap")
                      
public class LinkWSSoapImpl1 implements LinkWSSoap {

    private static final Logger LOG = Logger.getLogger(LinkWSSoapImpl.class.getName());

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#chargeUpMMS(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  cardNo ,)java.lang.String  cardPwd )*
     */
    public java.lang.String chargeUpMMS(java.lang.String corpID,java.lang.String pwd,java.lang.String cardNo,java.lang.String cardPwd) { 
        LOG.info("Executing operation chargeUpMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(cardNo);
        System.out.println(cardPwd);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#agentMakeAccount(java.lang.String  loginName ,)java.lang.String  loginPwd ,)java.lang.String  corpName ,)java.lang.String  linkMan ,)java.lang.String  tel ,)java.lang.String  mobile ,)java.lang.String  email ,)java.lang.String  memo ,)java.lang.String  corpID ,)java.lang.String  pass )*
     */
    public java.lang.String agentMakeAccount(java.lang.String loginName,java.lang.String loginPwd,java.lang.String corpName,java.lang.String linkMan,java.lang.String tel,java.lang.String mobile,java.lang.String email,java.lang.String memo,java.lang.String corpID,java.lang.String pass) { 
        LOG.info("Executing operation agentMakeAccount");
        System.out.println(loginName);
        System.out.println(loginPwd);
        System.out.println(corpName);
        System.out.println(linkMan);
        System.out.println(tel);
        System.out.println(mobile);
        System.out.println(email);
        System.out.println(memo);
        System.out.println(corpID);
        System.out.println(pass);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#helloWorld(*
     */
    public java.lang.String helloWorld() { 
        LOG.info("Executing operation helloWorld");
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#getReportFail(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  cell )*
     */
    public java.lang.String getReportFail(java.lang.String corpID,java.lang.String pwd,java.lang.String cell) { 
        LOG.info("Executing operation getReportFail");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(cell);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#getMMS(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public java.lang.String getMMS(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation getMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#agentChangeAccount(java.lang.String  loginName ,)java.lang.String  loginPwd ,)java.lang.String  corpID ,)int  smsBalance ,)int  mmsBalance )*
     */
    public java.lang.String agentChangeAccount(java.lang.String loginName,java.lang.String loginPwd,java.lang.String corpID,int smsBalance,int mmsBalance) { 
        LOG.info("Executing operation agentChangeAccount");
        System.out.println(loginName);
        System.out.println(loginPwd);
        System.out.println(corpID);
        System.out.println(smsBalance);
        System.out.println(mmsBalance);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#chargeUp(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  cardNo ,)java.lang.String  cardPwd )*
     */
    public int chargeUp(java.lang.String corpID,java.lang.String pwd,java.lang.String cardNo,java.lang.String cardPwd) { 
        LOG.info("Executing operation chargeUp");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(cardNo);
        System.out.println(cardPwd);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#reg(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  corpName ,)java.lang.String  linkMan ,)java.lang.String  tel ,)java.lang.String  mobile ,)java.lang.String  email ,)java.lang.String  memo )*
     */
    public int reg(java.lang.String corpID,java.lang.String pwd,java.lang.String corpName,java.lang.String linkMan,java.lang.String tel,java.lang.String mobile,java.lang.String email,java.lang.String memo) { 
        LOG.info("Executing operation reg");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(corpName);
        System.out.println(linkMan);
        System.out.println(tel);
        System.out.println(mobile);
        System.out.println(email);
        System.out.println(memo);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#updPwd(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  newPwd )*
     */
    public int updPwd(java.lang.String corpID,java.lang.String pwd,java.lang.String newPwd) { 
        LOG.info("Executing operation updPwd");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(newPwd);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#unReg(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public int unReg(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation unReg");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#getReportSMS(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public java.lang.String getReportSMS(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation getReportSMS");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#sendMMS(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobile ,)java.lang.String  base64Content ,)java.lang.String  title ,)java.lang.String  extCode ,)java.lang.String  sendTime )*
     */
    public java.lang.String sendMMS(java.lang.String corpID,java.lang.String pwd,java.lang.String mobile,java.lang.String base64Content,java.lang.String title,java.lang.String extCode,java.lang.String sendTime) { 
        LOG.info("Executing operation sendMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobile);
        System.out.println(base64Content);
        System.out.println(title);
        System.out.println(extCode);
        System.out.println(sendTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#send(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobile ,)java.lang.String  content ,)java.lang.String  cell ,)java.lang.String  sendTime )*
     */
    public int send(java.lang.String corpID,java.lang.String pwd,java.lang.String mobile,java.lang.String content,java.lang.String cell,java.lang.String sendTime) { 
        LOG.info("Executing operation send");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobile);
        System.out.println(content);
        System.out.println(cell);
        System.out.println(sendTime);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#send2(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobile ,)java.lang.String  content ,)java.lang.String  cell ,)java.lang.String  sendTime )*
     */
    public java.lang.String send2(java.lang.String corpID,java.lang.String pwd,java.lang.String mobile,java.lang.String content,java.lang.String cell,java.lang.String sendTime) { 
        LOG.info("Executing operation send2");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobile);
        System.out.println(content);
        System.out.println(cell);
        System.out.println(sendTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#batchSendMMS(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobiles ,)java.lang.String  base64Content ,)java.lang.String  title ,)java.lang.String  extCode ,)java.lang.String  sendTime )*
     */
    public java.lang.String batchSendMMS(java.lang.String corpID,java.lang.String pwd,java.lang.String mobiles,java.lang.String base64Content,java.lang.String title,java.lang.String extCode,java.lang.String sendTime) { 
        LOG.info("Executing operation batchSendMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobiles);
        System.out.println(base64Content);
        System.out.println(title);
        System.out.println(extCode);
        System.out.println(sendTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#sendMMS2(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobile ,)java.lang.String  base64Content ,)java.lang.String  title ,)java.lang.String  extCode ,)java.lang.String  sendTime )*
     */
    public java.lang.String sendMMS2(java.lang.String corpID,java.lang.String pwd,java.lang.String mobile,java.lang.String base64Content,java.lang.String title,java.lang.String extCode,java.lang.String sendTime) { 
        LOG.info("Executing operation sendMMS2");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobile);
        System.out.println(base64Content);
        System.out.println(title);
        System.out.println(extCode);
        System.out.println(sendTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#balanceMMS(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public java.lang.String balanceMMS(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation balanceMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#batchSend(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobile ,)java.lang.String  content ,)java.lang.String  cell ,)java.lang.String  sendTime )*
     */
    public int batchSend(java.lang.String corpID,java.lang.String pwd,java.lang.String mobile,java.lang.String content,java.lang.String cell,java.lang.String sendTime) { 
        LOG.info("Executing operation batchSend");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobile);
        System.out.println(content);
        System.out.println(cell);
        System.out.println(sendTime);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#batchSendMMS2(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobiles ,)java.lang.String  base64Content ,)java.lang.String  title ,)java.lang.String  extCode ,)java.lang.String  sendTime )*
     */
    public java.lang.String batchSendMMS2(java.lang.String corpID,java.lang.String pwd,java.lang.String mobiles,java.lang.String base64Content,java.lang.String title,java.lang.String extCode,java.lang.String sendTime) { 
        LOG.info("Executing operation batchSendMMS2");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobiles);
        System.out.println(base64Content);
        System.out.println(title);
        System.out.println(extCode);
        System.out.println(sendTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#selSum(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public int selSum(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation selSum");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#getReportMMS(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public java.lang.String getReportMMS(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation getReportMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#updReg(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  corpName ,)java.lang.String  linkMan ,)java.lang.String  tel ,)java.lang.String  mobile ,)java.lang.String  email ,)java.lang.String  memo )*
     */
    public int updReg(java.lang.String corpID,java.lang.String pwd,java.lang.String corpName,java.lang.String linkMan,java.lang.String tel,java.lang.String mobile,java.lang.String email,java.lang.String memo) { 
        LOG.info("Executing operation updReg");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(corpName);
        System.out.println(linkMan);
        System.out.println(tel);
        System.out.println(mobile);
        System.out.println(email);
        System.out.println(memo);
        try {
            int _return = 0;
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#getReportFailMMS(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  cell )*
     */
    public java.lang.String getReportFailMMS(java.lang.String corpID,java.lang.String pwd,java.lang.String cell) { 
        LOG.info("Executing operation getReportFailMMS");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(cell);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#batchSend2(java.lang.String  corpID ,)java.lang.String  pwd ,)java.lang.String  mobile ,)java.lang.String  content ,)java.lang.String  cell ,)java.lang.String  sendTime )*
     */
    public java.lang.String batchSend2(java.lang.String corpID,java.lang.String pwd,java.lang.String mobile,java.lang.String content,java.lang.String cell,java.lang.String sendTime) { 
        LOG.info("Executing operation batchSend2");
        System.out.println(corpID);
        System.out.println(pwd);
        System.out.println(mobile);
        System.out.println(content);
        System.out.println(cell);
        System.out.println(sendTime);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    /* (non-Javadoc)
     * @see shuma.com.LinkWSSoap#get(java.lang.String  corpID ,)java.lang.String  pwd )*
     */
    public java.lang.String get(java.lang.String corpID,java.lang.String pwd) { 
        LOG.info("Executing operation get");
        System.out.println(corpID);
        System.out.println(pwd);
        try {
            java.lang.String _return = "";
            return _return;
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

}
