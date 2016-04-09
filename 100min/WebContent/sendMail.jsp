<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String to="order@100min.co.kr";
String from="order@100min.co.kr";

String error = "";
String date = request.getParameter("date");
String time = request.getParameter("time");
String adress1 = request.getParameter("adress1");
String adress2 = request.getParameter("adress2");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String note = request.getParameter("note");
String subject = "[백의민족] "+name + "님의 주문입니다.";
String content = "이름  : " + name +" <br>전화번호 : " + phone + " <br>수거요청시간 : " + date + " " + time + " <br>주소 : " + adress1 + " " + adress2 + "<br>비고 : " + note;

String datetime1 = date +""+ time.substring(0,2); // 입력받은시간
// 입력값 받음



Date now = new Date();
SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHH");
String datetime2 = dateformat.format(now); //현재시간

String hour = datetime2.substring(8,10);




Properties p = new Properties(); // 정보를 담을 객체

p.put("mail.smtp.host","smtp.worksmobile.com"); // 네이버 SMTP

p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP 서버에 접속하기 위한 정보들

try{
    Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject(subject); // 제목
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

    
    if(adress1.contains("강서구") || adress1.contains("양천구") || adress1.contains("마포구") || adress1.contains("영등포구")) {
    	if(Integer.valueOf(datetime2) < Integer.valueOf(datetime1)) {
    		 Transport.send(msg); // 전송
    	}
    	else {
    		error = "마감된 시간입니다 현재 " + (Integer.valueOf(hour)+1) +"시 부터 주문이 가능합니다.";
    		throw new Exception();
    		//익셉션 뉴
    	}    	
    }
    else{
    	error = "123서비스 지역이 아닙니다. 죄송합니다. 현재 강서, 양천, 마포, 영등포만 주문이 가능합니다.";
    	throw new Exception();
    }
    
    
   
    
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('" + error + "');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}

out.println("<script>alert('주문 완료.');location.href='index.jsp';</script>");
// 성공 시
%>