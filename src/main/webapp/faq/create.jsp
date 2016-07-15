<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
 <!-- Basic CSS -->
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/JavaScript">
  $(function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  });
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>F A Q</h2>
          <hr class="star-primary"/>
         
          </DIV>
         </div>          
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <FORM name='frm' method='POST' action='./create.do' >
              <div class="row control-group">
          <%--      <input type = "hidden" name='uno' id='uno' value='${TrashVO.uno }' >  --%>
                  <div class="row">
    <div class="col-lg-12 text-center">
    <ASIDE style='float: left; width: 12%;'>
      <select class="input-sm" id="fcategory" name="fcategory" onchange="javascript:change();">
     <option value="질문1">질문1</option>
     <option value="질문2">질문2</option>
     <option value="질문3">질문3</option>
     <option value="질문4">질문4</option>
   </select>
   </ASIDE>
   
          </div>
          </div>
                <div class="form-group col-xs-12">
                
                  <label>TITLE </label>
                  <input type="text" class="form-control" value="제목" placeholder="제목" id="ftitle" name="ftitle" required>    
                  <p class="help-block text-danger"></p>
                       <div class="row control-group">
                <div
                  class="form-group col-xs-12">
                  <label>CONTENT</label>
                  <textarea rows="5" class="form-control" id="fcontent" name="fcontent" placeholder="내용" required>내용</textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              
                </div>
              </div>
              
              
              
              
              
              
              <%if(session.getAttribute("id")==null){ %>
              
<div class="row control-group"> 
<div class="form-group col-xs-12 ">
      <label for="capa">ID</label>
      <input type="text" class="form-control" placeholder="비회원 아이디" id="fid" name="fid" required>
   <p class="help-block text-danger"></p>
  </div>
</div>

<div class="row control-group">
<div class="form-group col-xs-12 ">
      <label for="capa">PASSWORD</label>
      <input type="text" class="form-control" placeholder="비회원 비밀번호" id="fpasswd" name="fpasswd" required>
   <p class="help-block text-danger"></p>
  </div>
</div>
             <%}else{
               
         
             %> 
              
             <input type="hidden" id="fid" name="fid" value="${id }">
             <input type="hidden" id="uno" name="uno" value="${uno }">
              
              <% 
             } %>
              
         
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">SEND</button>
                  <button type="button" class="btn btn-success btn-lg" onclick="location.href='./list2.do'">LIST</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      </section>
<!--         <label class='label' for='maxcapa'>Maximum Capacity</label>
        <input type='text' name='maxcapa' id='maxcapa' value='5m' required="required"> -->
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 