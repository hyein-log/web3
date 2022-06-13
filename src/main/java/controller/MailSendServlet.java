package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailSendServlet
 */
@WebServlet("/login/MailSend.do")
public class MailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");


        //mail server �꽕�젙
        String user = "oversteam@naver.com"; //�옄�떊�쓽 �꽕�씠踰� 怨꾩젙
        String password = "8NKEX18265ER";//�옄�떊�쓽 �꽕�씠踰� �뙣�뒪�썙�뱶
        
        
        //SMTP �꽌踰� �젙蹂대�� �꽕�젙�븳�떎.
        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", 587);
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.ssl.enable", "true");
//        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.ssl.enable", "true");
//        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
        
        //�씤利� 踰덊샇 �깮�꽦湲�
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        //email �쟾�넚
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user,"KO3BANK"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            

            //메일 제목
            msg.setSubject("안녕하세요 KO3 BANK 인증 메일입니다.");
            //메일 내용

            msg.setText("인증 번호는    :   "+temp);


            
            Transport.send(msg);
            System.out.println("�씠硫붿씪 �쟾�넚");
            
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        }

        System.out.println(id);
        System.out.println(pass);
        System.out.println(email);
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);

        //id 찾기 일때
        if(id!=null) {
        	saveKey.setAttribute("id", id);
        }
        //password찾기 일때
        if(pass!=null) {
        	saveKey.setAttribute("pass", pass);
        	saveKey.setAttribute("email", email);
        }

        request.getRequestDispatcher("emailConfirm.jsp").forward(request, response);
	}

}