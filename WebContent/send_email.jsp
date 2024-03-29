<%@page import="java.util.ArrayList"%>
<%@page import="bd.dbos.EmailAccount"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% if (session.getAttribute("name") == null) { response.sendRedirect("index.jsp"); return; }%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Enviar Email</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    
	<!-- Include stylesheet -->
	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  
      <link rel="stylesheet" href="./css/style.css">

  
</head>

<body>


  	<div class="form">
      
      <!--
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>-->
      
      <div class="tab-content">
        
        <div >   
          <h1>Envie um email</h1>
          
          <form action="send_email_b.jsp" method="post" id="form" enctype="multipart/form-data">
          
           
          <div class="field-wrap">
            
            <span >Selecione a conta de email</span>

            
            <div class="select-style">
            <select class="select-style" name="name_email" id="name_email">
			<%
			ArrayList<EmailAccount> contasE = (ArrayList<EmailAccount>)session.getAttribute("contasE");
				for(EmailAccount conta : contasE)
				{
					%> <option value="<%=conta.getEmail()%>"> <%=conta.getEmail() %> </option> <%
				}
			%>
			</select>
			</div>
          </div>
          
          <div class="field-wrap">
            <label>
              Assunto<span class="req">*</span>
            </label>
            <input type="text" name="assunto" id="assunto" required autocomplete="off"/>
          </div>
          
           <div class="field-wrap">
            <label>
              Destino<span class="req">*</span>
            </label>
            <input type="text" name="destino" id="destino" required autocomplete="off"/>
          </div>
          

           <div class="field-wrap">
            <label>
              DestinoCC
            </label>
            <input type="text" name="destinocc" id="destinocc" />
          </div>
          
          
           <div class="field-wrap">
            <label>
              DestinoCCO
            </label>
            <input type="text" name="destinocco" id="destinocco" />
          </div>
          
           <div class="field-wrap" id="editor">
            <!--<label>
             Texto<span class="req"></span>
            </label>
            <textarea type="text" name="texto" id="texto" cols="40" rows="5" required autocomplete="off"/></textarea>-->
          </div>
          <input type="hidden" name="texto" id="texto">
          
          	<!-- Include the Quill library -->
			<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

			<!-- Initialize Quill editor -->
			<script>
  			var quill = new Quill('#editor', {
    			theme: 'snow'
  			});
			</script>
          
           <!--<div class="field-wrap">
            <label>
              Tipo
            </label>
            <input type="text" name="tipo" id="tipo" />
          </div>-->
          
           <div class="field-wrap">
            <label>
              Anexo
            </label>
            <input type="file" multiple="multiple" name="anexo" id="anexo" size="50">
          </div>
          
         
         
         
          <button class="button button-block" onclick="$('input#texto[type=hidden]').val($('div#editor > div.ql-editor').html()); $('form#form').submit();"/>Enviar</button>
          
          </form>

        </div>
        
  		<div></div><!--  precisa desse bagulho ai kkkkkkkk-->
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="./script/script.js"></script>




</body>

</html>
