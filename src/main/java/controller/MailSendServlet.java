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

        //mail server ����
        String user = "oversteam@naver.com"; //�ڽ��� ���̹� ����
        String password = "8NKEX18265ER";//�ڽ��� ���̹� �н�����
        
        
        //SMTP ���� ������ �����Ѵ�.
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
        
        //���� ��ȣ ������
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
        
        //email ����
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user,"KO3BANK"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            //���� ����
            msg.setSubject("�ȳ��ϼ��� KO3 BANK ���� �����Դϴ�.");
            //���� ����
            msg.setText("���� ��ȣ��    :   "+temp);
            
            Transport.send(msg);
            System.out.println("�̸��� ����");
            
        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        }
        System.out.println(id);
        System.out.println(pass);
        System.out.println(email);
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
        //id ã�� �϶�
        if(id!=null) {
        	saveKey.setAttribute("id", id);
        }
        //passwordã�� �϶�
        if(pass!=null) {
        	saveKey.setAttribute("pass", pass);
        	saveKey.setAttribute("email", email);
        }
        request.getRequestDispatcher("emailConfirm.jsp").forward(request, response);
	}

}
