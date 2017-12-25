<%
/**************************************************************************************************************************
* Program Name  : ����Ȯ�� ��� ���� Sample JSP 
* File Name     : pcc_V3_result_seed.jsp
* Comment       : 
* History       :  
*
**************************************************************************************************************************/
%>

<%@ page  contentType = "text/html;charset=ksc5601"%>
<%@ page import = "java.util.*" %> 
    [����Ȯ�� ��� ���� Sample - JSP ] <br> <br>
<%
    // ���� --------------------------------------------------------------------------------
    String retInfo		= "";																// �������

	String name			= "";                                                               //����
	String sex			= "";																//����
	String birYMD		= "";																//�������
	String fgnGbn		= "";																//���ܱ��� ���а�
	
    String di			= "";																//DI
    String ci1			= "";																//CI
    String ci2			= "";																//CI
    String civersion    = "";                                                               //CI Version
    
    String reqNum		= "";                                                               // ����Ȯ�� ��û��ȣ
    String result		= "";                                                               // ����Ȯ�ΰ�� (Y/N)
    String certDate		= "";                                                               // �����ð�
    String certGb		= "";                                                               // ��������
	String cellNo		= "";																// �ڵ��� ��ȣ
	String cellCorp		= "";																// �̵���Ż�
	String addVar		= "";


	//��ȭȭ�� ����
	String encPara		= "";
	String encMsg		= "";
	String msgChk       = "N";  
	
    //-----------------------------------------------------------------------------------------------------------------
    
    //��Ű�� ���� ����
	    Cookie[] cookies = request.getCookies();
	    String cookiename = "";
	    String cookiereqNum = "";
		if(cookies!=null){
			for (int i = 0; i < cookies.length; i++){
				Cookie c = cookies[i];
				cookiename = c.getName();
				cookiereqNum = c.getValue();
				if(cookiename.compareTo("reqNum")==0) break;
				
				cookiereqNum = null;
			}
		}

    try{

        // Parameter ���� --------------------------------------------------------------------
        retInfo  = request.getParameter("retInfo").trim();

%>
            [��ȣȭ �ϱ��� ���Ű�] <br>
            <br>
            retInfo : <%=retInfo%> <br>
            <br>
<%
        // 1. ��ȣȭ ��� (jar) Loading
        com.sci.v2.pcc.secu.SciSecuManager sciSecuMg = new com.sci.v2.pcc.secu.SciSecuManager();
        //��Ű���� ������ ���� Key�� ���� �Ѵ�.
        retInfo  = sciSecuMg.getDec(retInfo, cookiereqNum);

        // 2.1�� �Ľ�---------------------------------------------------------------
        String[] aRetInfo1 = retInfo.split("\\^");

		encPara  = aRetInfo1[0];         //��ȣȭ�� ���� �Ķ����
        encMsg   = aRetInfo1[1];    //��ȣȭ�� ���� �Ķ������ Hash��
		
		String  encMsg2   = sciSecuMg.getMsg(encPara);
			// 3.��/���� ���� ---------------------------------------------------------------
        if(encMsg2.equals(encMsg)){
            msgChk="Y";
        }

		if(msgChk.equals("N")){
%>
		    <script language=javascript>
            alert("���������� �����Դϴ�.!!<%=msgChk%>");
		    </script>
<%
			return;
		}


        // ��ȣȭ �� ��/���� ���� ---------------------------------------------------------------
		retInfo  = sciSecuMg.getDec(encPara, cookiereqNum);

        String[] aRetInfo = retInfo.split("\\^");
		
        name		= aRetInfo[0];
		birYMD		= aRetInfo[1];
        sex			= aRetInfo[2];        
        fgnGbn		= aRetInfo[3];
        di			= aRetInfo[4];
        ci1			= aRetInfo[5];
        ci2			= aRetInfo[6];
        civersion	= aRetInfo[7];
        reqNum		= aRetInfo[8];
        result		= aRetInfo[9];
        certGb		= aRetInfo[10];
		cellNo		= aRetInfo[11];
		cellCorp	= aRetInfo[12];
        certDate	= aRetInfo[13];
		addVar		= aRetInfo[14];


%>
<html>
    <head>
        <title>SCI������ ����Ȯ�μ���  �׽�Ʈ</title>
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <style>
            <!--
            body,p,ol,ul,td
            {
                font-family: ����;
                font-size: 12px;
            }

            a:link { size:9px;color:#000000;text-decoration: none; line-height: 12px}
            a:visited { size:9px;color:#555555;text-decoration: none; line-height: 12px}
            a:hover { color:#ff9900;text-decoration: none; line-height: 12px}

            .style1 {
                color: #6b902a;
                font-weight: bold;
            }
            .style2 {
                color: #666666
            }
            .style3 {
                color: #3b5d00;
                font-weight: bold;
            }
            -->
        </style>
    </head>
	<body>
            [��ȣȭ �� ���Ű�] <br>
            <br>
            <table cellpadding="1" cellspacing="1" border="1">
				<tr>
					<td align="center" colspan="2">����Ȯ�� ���</td>
				</tr>
				<tr>
                    <td align="left">����</td>
                    <td align="left"><%=name%></td>
                </tr>
				<tr>
                    <td align="left">����</td>
                    <td align="left"><%=sex%></td>
                </tr>
				<tr>
                    <td align="left">�������</td>
                    <td align="left"><%=birYMD%></td>
                </tr>
				<tr>
                    <td align="left">���ܱ��� ���а�(1:������, 2:�ܱ���)</td>
                    <td align="left"><%=fgnGbn%></td>
                </tr>				
				<tr>
                    <td align="left">�ߺ�����������</td>
                    <td align="left"><%=di%></td>
                </tr>
				<tr>
                    <td align="left">��������1</td>
                    <td align="left"><%=ci1%></td>
                </tr>
				<tr>
                    <td align="left">��������2</td>
                    <td align="left"><%=ci2%></td>
                </tr>
				<tr>
                    <td align="left">������������</td>
                    <td align="left"><%=civersion%></td>
                </tr>
                <tr>
                    <td align="left">��û��ȣ</td>
                    <td align="left"><%=reqNum%></td>
                </tr>
				<tr>
                    <td align="left">������������</td>
                    <td align="left"><%=result%></td>
                </tr>
				<tr>
                    <td align="left">��������</td>
                    <td align="left"><%=certGb%></td>
                </tr>
				<tr>
                    <td align="left">�ڵ�����ȣ</td>
                    <td align="left"><%=cellNo%>&nbsp;</td>                
                </tr>
				<tr>
                    <td align="left">�̵���Ż�</td>
                    <td align="left"><%=cellCorp%>&nbsp;</td>                
                </tr>
                <tr>
                    <td align="left">��û�ð�</td>
                    <td align="left"><%=certDate%></td>
                </tr>				
				<tr>
                    <td align="left">�߰��Ķ����</td>
                    <td align="left"><%=addVar%>&nbsp;</td>
                </tr>
            </table>            
            <br>
            <br>
            <a href="http://.../pcc_V3_input_seed.jsp">[Back]</a>
</body>
</html>
<%
        // ----------------------------------------------------------------------------------

    }catch(Exception ex){
          System.out.println("[pcc] Receive Error -"+ex.getMessage());
    }
%>