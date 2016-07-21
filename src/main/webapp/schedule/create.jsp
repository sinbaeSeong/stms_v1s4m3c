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
function checkData(f){ // f == document.frmData 객체
    var msg; // 에러 메세지
    var str; // 임시 문자열 저장 변수
      
    // 제목 앞뒤의 공백 제거
    str = f.title.value.replace(/^\s*|\s*$/g,'');
    if (str.length == 0){
        msg = '안내\n\n제목을 입력해 주십시오'; 
        window.alert(msg);
        f.title.focus();
        return false;
    }
    
    // 내용 앞뒤의 공백 제거
    str = f.content.value.replace(/^\s*|\s*$/g,''); 

    // 이름의 길이를 비교
    if (str.length == 0){
        msg = '안내\n\n내용을 입력해 주십시오'; 
        window.alert(msg);
        f.content.focus();
        return false;
    }
    
    return true;
}
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <DIV class='col-lg-12 text-center'><h2>Schedule Create</h2>
          <hr class="star-primary"/>
         
          </DIV>
         </div>          
      <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <FORM name='frm' method='POST' action='./create.do' >
              <div class="row control-group">
               <input type = "hidden" name='uno' id='uno' value='${param.uno }' >
                <div class="form-group col-xs-12">
                  <label> Labeldate </label>
                  <input type="date" class="form-control"  id="slabeldate" name="slabeldate" required>    
                  <p class="help-block text-danger"></p>
                </div>
              </div>
                         
              <!-- label -->
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                    <label>Label</label>
                    <input type="text" class="form-control" placeholder="label" id="slabel" name="slabel" required>
                 <p class="help-block text-danger"></p>
                </div>
              </div>
              
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                    <label>Title </label>
                    <input type="text" class="form-control" placeholder="title" id="stitle" name="stitle" required>
                 <p class="help-block text-danger"></p>
                </div>
              </div>
              
              <!-- content -->
              <div class="row control-group">
                <div
                  class="form-group col-xs-12">
                  <label>Content</label>
                  <textarea rows="10" class="form-control" id="content" name="content" placeholder="content" required ></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              
              <!--  uno -->   
              <div class="row control-group">
              <div class="form-group col-xs-12 ">
                    <label for="uno">User</label>
                    <input type="text" class="form-control" id="uno" name="uno" value ="${param.uno }" required data-validation-required-message="Please enter something capacity." style="width:40%;">
                 <p class="help-block text-danger"></p>
                </div>
              </div>
              
              <br>
              <div id="success"></div>
              <div class="row">
                <div class="form-group col-xs-12">
                  <button type="submit" class="btn btn-success btn-lg">Sign up</button>
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