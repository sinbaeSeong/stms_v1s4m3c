<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <% int uno = Integer.parseInt(request.getParameter("uno")); %>
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
<script type="text/javascript">

$(function(){
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<!-- 로그인 체크 -->
<% if (session.getAttribute("id") == null){ %>
    <section id="contact"> 
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Caution</h2>
          <hr class="star-primary"/>
          </DIV>
         </div>
         
         <!--caution img -->         
         <div class="row">
           <div class="col-lg-12">
             <a href="../user/login.do"><img style="margin:0px auto;" class="img-responsive" src='../images/caution.png' ></a>                    
           </div>
         </div>
       </div>
     </section>
<%} else{%> 

<!-- body 시작 -->
     <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Modify Schedule</h2>
          <hr class="star-primary"/>
         
          </DIV>
         </div>          
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <FORM name='frm' method='POST' action='./update.do' >
              <div class="row control-group">
                <input type ="hidden" name='sno' id='sno' value='${scheduleVO.sno }' >   
                <input type ="hidden" name='uno' id='uno' value='<%=uno %>' >              
               
                <div class="form-group col-xs-12">
                  <label>Labeldate </label>
                  <input type="text" class="form-control" value="${scheduleVO.slabeldate }" id="slabeldate" name="slabeldate" required>    
                  <p class="help-block text-danger"></p>
               </div>
              </div>
              
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                    <label for='file1'>Label</label>
                       <select id='slabel' class="form-control"name='slabel' style="width: 20%;" >
                      <option>Schedule label</option>
                        <option value='vacation' >Vacation</option>
                        <option value='absenteeism' >Absenteeism</option>
                        <option value='etc' >Etc...</option>
                    </select> 
                  <p class="help-block text-danger"></p>
                </div>
              </div>
            
              <div class="row control-group">
                <div
                  class="form-group col-xs-12">
                  <label>Title</label>
                  <input type="text" class="form-control" value="${scheduleVO.stitle }" id="stitle" name='stitle' >
                  <p class="help-block text-danger"></p>
                </div>
              </div>
            
              <div class="row control-group">
                <div class="form-group col-xs-12">
                  <label>Content</label>
                   <textarea rows="5" class="form-control" id="content" name="content" required >${scheduleVO.content }</textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Update</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      </section>
 <%} %>
<!-- -------------------------------------------- -->

</body>
<!-- -------------------------------------------- -->
</html> 