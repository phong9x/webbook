package org.trams.webbook.common.mail;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Mail {
	private MailSender mailSender;
	private SimpleMailMessage simpleMailMessage;
	
	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String to, String subject) {
		try {
			System.setProperty("mail.mime.charset", "utf8");
			SimpleMailMessage message = new SimpleMailMessage(simpleMailMessage);
			message.setTo(to);
			message.setText(String.format(simpleMailMessage.getText(), subject));
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}
}
