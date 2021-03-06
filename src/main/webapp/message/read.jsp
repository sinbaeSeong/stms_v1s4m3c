<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>제목</title> 

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<!-- Basic CSS -->

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"  type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript" src="../js/tool.js"></script>

 <script type="text/JavaScript">
function del(mno){
   if(!confirm("정말 삭제하시겠습니까?")){
      return;
   } else {
      var f = document.createElement("form");
      f.setAttribute("method","post");
      f.setAttribute("action","./delete.do");
      document.body.appendChild(f);
      
      var i = document.createElement("input");
      i.setAttribute("type","hidden");
      i.setAttribute("name","mno");
      i.setAttribute("value", mno);
      f.appendChild(i);
      
      f.submit();
   }
}
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

    <!-- Bootstrap CSS Start -->
    <section id="contact">
    <div class="container">
    
    
          <!-- Form Start -->
          <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
              
              
              <!-- Input Title -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Title </label>
                     <input type="text" class="form-control" value="${messageVO.title }" id="title"
                     name="title" readonly>    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              <!-- Input Date -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label>Send Date </label>
                     <input type="text" class="form-control" value="${messageVO.mdate }" id="mdate"
                     name="mdate" readonly>    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Name -->
              <div class="row control-group">
              <div class="form-group col-xs-12">
                  <label >Sender </label>
                     <input type="text" class="form-control" value="${messageVO.sender }" id="name"
                     name="name" readonly>    
                  <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- Input Text -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                 <label>Content</label>
                    <textarea class="form-control" readonly="readonly">${messageVO.mcontent }</textarea>
                 <p class="help-block text-danger"></p>
              </div>
              </div>
              
              
              <!-- button -->
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="button" class="btn btn-success btn-lg" onclick="history.back();">Back</button>  
                  <button type="button" class="btn btn-success btn-lg" onclick="javascript:del(${messageVO.mno })">Delete</button>  
                  <button type="button" class="btn btn-success btn-lg" onclick='location.href="../message/create.do?receiver=${messageVO.sender_id }"'>Reply</button>  
              </div>
              </div>
              
            <!-- Form end -->
            </div>
            </div>
        
        
      <!-- Bootstrap CSS end -->
      </div>
      </section>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 