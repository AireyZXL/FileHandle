<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>文件上传</title>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">

        $(function () {
           $("#btnShow").on('click', function () {
               $("#ulList").empty();
               var fp = $("#fUpload");
               var lg = fp[0].files.length; // get length
               var items = fp[0].files;
               var fragment = "";
                alert(33333);
               if (lg > 0) {
                   for (var i = 0; i < lg; i++) {
                       var fileName = items[i].name; // get file name
                       var fileSize = Math.round(items[i].size/1024); // get file size
                       var fileType = items[i].type; // get file type
                       var fileTime=items[i].lastModifiedDate;


                       // append li to UL tag to display File info
                       fragment += "<li>" + fileName + " (<b>" + fileSize+ "</b> KB) - Type :" + fileType + "</li>";
                       fragment += "<li> Date: "+fileTime +"</li>";
                   }

                   $("#ulList").append(fragment);
               }
           });
       })

    </script>
</head>

<body>
<form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">
    上传用户：<input type="text" name="username"><br/>
    上传文件1：<input type="file" id="fUpload" name="file1"><br/>

    上传文件2：<input type="file" name="file2"><br/>
    <input type="submit" value="提交">

    <ul id="ulList"></ul>
    <input id="btnShow" type="button" value="显示上传文件的详细详细" />

</form>
</body>
</html>