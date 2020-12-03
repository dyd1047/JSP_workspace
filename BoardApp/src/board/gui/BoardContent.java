package board.gui;

import java.awt.Dimension;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import board.model.Notice;
import board.model.NoticeDAO;

public class BoardContent extends Page{
	JTextField t_title;
	JTextField t_author;
	JTextArea area;
	JScrollPane scroll;
	JButton bt_list, bt_edit, bt_del;
	NoticeDAO noticeDAO;
	Notice notice;
	
	public BoardContent(BoardMain boardMain) {
		super(boardMain);
		
		//����
		t_author = new JTextField();
		t_title = new JTextField();
		area = new JTextArea();
		scroll = new JScrollPane(area);
		
		bt_list = new JButton("�������");
		bt_edit = new JButton("����");
		bt_del = new JButton("����");
		noticeDAO = new NoticeDAO();
		
		//��Ÿ��
		t_author.setPreferredSize(new Dimension((int)this.getPreferredSize().getWidth()-10, 25));
		t_title.setPreferredSize(new Dimension((int)this.getPreferredSize().getWidth()-10, 25));
		scroll.setPreferredSize(new Dimension((int)this.getPreferredSize().getWidth()-10, 500));
		
		//����
		add(t_author);
		add(t_title);
		add(scroll);
		
		add(bt_list);
		add(bt_edit);
		add(bt_del);
		
		bt_list.addActionListener((e)->{
			boardMain.showPage(Pages.valueOf("BoardList").ordinal());
		});
		
		bt_edit.addActionListener((e)->{
			notice.setAuthor(t_author.getText());
			notice.setTitle(t_title.getText());
			notice.setContent(area.getText());
			int result = noticeDAO.edit(notice);
		
			if(result == 0) {
				JOptionPane.showMessageDialog(BoardContent.this, "���� ����");
			}else {
				JOptionPane.showMessageDialog(BoardContent.this, "���� ����");
				boardMain.showPage(Pages.valueOf("BoardContent").ordinal());
			}
		});
		
		bt_del.addActionListener((e)->{
			int result = noticeDAO.delete(notice.getNotice_id());
			
			if(result == 0) {
				JOptionPane.showMessageDialog(BoardContent.this, "���� ����");
			}else {
				JOptionPane.showMessageDialog(BoardContent.this, "���� ����");
				boardMain.showPage(Pages.valueOf("BoardList").ordinal());
			}
		});
		
	}
	
	//������Ʈ�� ������ ä���ֱ�!
	//�� �޼��带 ȣ���ϴ� �ڴ�, �Ѱ��� �����͸� VO�� ��Ƽ� ȣ���ϸ� �ȴ�.
	public void setData(Notice notice) {
		this.notice = notice; //���߿� ������ ����ؼ� ����!!
		
		t_author.setText(notice.getAuthor());
		t_title.setText(notice.getTitle());
		area.setText(notice.getContent());
	}
	
}
