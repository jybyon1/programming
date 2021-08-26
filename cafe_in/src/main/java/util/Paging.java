package util;
/*
        nowPage:����������
        rowTotal:��ü�����Ͱ���
        blockList:���������� �Խù���
        blockPage:��ȭ�鿡 ��Ÿ�� ������ ��ϼ�
 */
public class Paging {
	
	public static String getPaging(
			String pageURL,
			int nowPage, 
			int rowTotal,
			int blockList, 
			int blockPage){
		
		int totalPage/*��ü��������*/,
            startPage/*������������ȣ*/,
            endPage;/*��������������ȣ*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��
		
		
		isPrevPage=isNextPage=false;
		
		//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = rowTotal/blockList;
		if(rowTotal%blockList!=0)totalPage++;
		

		//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		//���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if(nowPage > totalPage)nowPage = totalPage;
		

		//���� �������� ������ �������� ����.
		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //
		
		//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if(endPage > totalPage)endPage = totalPage;
		
		//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		//boolean�� ������ ���� ����
		if(endPage < totalPage) isNextPage = true;
		//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if(startPage > 1)isPrevPage = true;
		
		//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append(startPage-1);
			sb.append("'>��</a>");
		}
		else
			sb.append("��");
		
//------������ ��� ��� -------------------------------------------------------------------------------------------------
		sb.append("|");
		
		for(int i=startPage; i<= endPage ;i++){
			
			if(i>totalPage)break;
			
			if(i == nowPage){ //���� �ִ� ������
				sb.append("&nbsp;<b><font color='red'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//���� �������� �ƴϸ�
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}// end for
		
		sb.append("&nbsp;|");
		
//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage+1);
			sb.append("'>��</a>");
		}
		else
			sb.append("��");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
		
	}//end-getPaging()
	
	
	public static String getCommentPaging(
			int nowPage, 
			int rowTotal,
			int blockList, 
			int blockPage){
		
		int totalPage/*��ü��������*/,
            startPage/*������������ȣ*/,
            endPage;/*��������������ȣ*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��
		
		
		isPrevPage=isNextPage=false;
		
		//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = rowTotal/blockList;
		if(rowTotal%blockList!=0)totalPage++;
		

		//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		//���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if(nowPage > totalPage)nowPage = totalPage;
		

		//���� �������� ������ �������� ����.
		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //
		
		//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if(endPage > totalPage)endPage = totalPage;
		
		//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		//boolean�� ������ ���� ����
		if(endPage < totalPage) isNextPage = true;
		//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if(startPage > 1)isPrevPage = true;
		
		//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			
			/* <a href="#" onclick="comment_list('1');">1</a> */
			sb.append(String.format("<a href='#' onclick=\"comment_list('%d');\">", startPage-1));
			//sb.append("<a href ='#' onclick=\"comment_list('" + (startPage-1) +"');\">");
			sb.append("��</a>");
			
		}
		else
			sb.append("��");
		
//------������ ��� ��� -------------------------------------------------------------------------------------------------
		sb.append("|");
		
		for(int i=startPage; i<= endPage ;i++){
			
			if(i>totalPage)break;
			
			if(i == nowPage){ //���� �ִ� ������
				sb.append("&nbsp;<b><font color='red'><span class='page_num'>");
				sb.append(i);
				sb.append("</span></font></b>");
			}
			else{//���� �������� �ƴϸ�
				//sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(String.format("&nbsp;<a href='#' onclick=\"comment_list('%d');\"><span class='page_num'>", i));
				sb.append(i);
				sb.append("</span></a>");
			}
		}// end for
		
		sb.append("&nbsp;|");
		
//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
		if(isNextPage){
			//sb.append("<a href='"+pageURL+"?page=");
			sb.append(String.format("<a href='#' onclick=\"comment_list('%d');\">", endPage+1));
			sb.append("��</a>");
		}
		else
			sb.append("��");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
		
	}//end-getPaging()
	
	
	public static String getPaging(
			String pageURL,
			int nowPage, 
			int rowTotal,
			String searchFilter,
			int blockList, 
			int blockPage){
		
		int totalPage/*��ü��������*/,
            startPage/*������������ȣ*/,
            endPage;/*��������������ȣ*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��
		
		
		isPrevPage=isNextPage=false;
		
		//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = rowTotal/blockList;
		if(rowTotal%blockList!=0)totalPage++;
		

		//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		//���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if(nowPage > totalPage)nowPage = totalPage;
		

		//���� �������� ������ �������� ����.
		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //
		
		//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if(endPage > totalPage)endPage = totalPage;
		
		//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		//boolean�� ������ ���� ����
		if(endPage < totalPage) isNextPage = true;
		//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if(startPage > 1)isPrevPage = true;
		
		//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("&nbsp;<a href ='"+pageURL+"?page=");
			sb.append(startPage-1);
			
			sb.append(searchFilter);
			
			
			sb.append("'>��</a>");
		}
		else
			sb.append("��");
		
//------������ ��� ��� -------------------------------------------------------------------------------------------------
		sb.append("|");
		
		for(int i=startPage; i<= endPage ;i++){
			
			if(i>totalPage)break;
			
			if(i == nowPage){ //���� �ִ� ������
				sb.append("&nbsp;<b><font color='red'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//���� �������� �ƴϸ�
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				
				sb.append(searchFilter);
				
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}// end for
		
		sb.append("&nbsp;|");
		
//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage+1);
			
			sb.append(searchFilter);
			
			sb.append("'>��</a>");
		}
		else
			sb.append("��");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}
	
	
	
	
	
	   public static String getReviewPaging(
               int nowPage, 
               int rowTotal,
               int blockList, 
               int blockPage){

int totalPage/*��ü��������*/,
startPage/*������������ȣ*/,
endPage;/*��������������ȣ*/

boolean  isPrevPage,isNextPage;
StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��


isPrevPage=isNextPage=false;

//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
totalPage = rowTotal/blockList;
if(rowTotal%blockList!=0)totalPage++;


//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
//���� ��� ������ ���������� ���� ��ü ������ ������ ����
if(nowPage > totalPage)nowPage = totalPage;


//���� �������� ������ �������� ����.
startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
endPage = startPage + blockPage - 1; //

//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
if(endPage > totalPage)endPage = totalPage;

//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
//boolean�� ������ ���� ����
if(endPage < totalPage) isNextPage = true;
//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
if(startPage > 1)isPrevPage = true;

//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------      
if(isPrevPage){

/* <a href="#" onclick="comment_list('1');">1</a> */

sb.append(String.format("&nbsp;<a href='#' onclick=\"review_list('%d');\">", startPage-1));
//sb.append("<a href ='#' onclick=\"comment_list('"+ (startPage-1) +"');\"> ");
sb.append("��</a>");
}
else
sb.append("��");

//------������ ��� ��� -------------------------------------------------------------------------------------------------
sb.append("|");
for(int i=startPage; i<= endPage ;i++){

if(i>totalPage)break;

if(i == nowPage){ //���� �ִ� ������
sb.append("&nbsp;<b><font color='red'><span class='page_num'>");
sb.append(i);
sb.append("</span></font></b>");
}
else{//���� �������� �ƴϸ�
//sb.append("&nbsp;<a href='"+pageURL+"?page=");
sb.append(String.format("&nbsp;<a href='#' onclick=\"review_list('%d');\"><span class='page_num'>", i));
sb.append(i);
sb.append("</span></a>");
}
}// end for

sb.append("&nbsp;|");

//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
if(isNextPage){
//sb.append("<a href='"+pageURL+"?page=");
sb.append(String.format("&nbsp;<a href='#' onclick=\"review_list('%d');\">", endPage+1));
sb.append("��</a>");
}
else
sb.append("��");
//---------------------------------------------------------------------------------------------------------------------       

return sb.toString();

}//end-getReviewPaging()

	
	
	
	
	
	
	
	
}