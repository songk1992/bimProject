<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/navbar-header.jsp" %>
<script src="../resources/bootstrap/js/bootstrap.js"></script>	<!-- Bootstrap core js(TODO locate footer) -->
<title>Insert title here</title>
</head>
<body>
<%--<div class="jumbotron">--%>
<%--<h2> 브리지 임팩트에 오신 것을 환영합니다!</h2>--%>
<%--<p> 청소년들이 하나님의 은혜를 체험하고 그 은혜 안에서 자라갈수 있기를 원합니다. </p>--%>
<%--<p>--%>
<%--<a class="btn btn-lg btn-primary" href="#" role="button">View navbar docs »</a>--%>
<%--</p>--%>
<%--</div>--%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
<%--        <li data-target="#myCarousel" data-slide-to="2"></li>--%>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="http://www.hcc.or.kr/Attachment/media/90009_181118_001.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="http://www.hcc.or.kr/Attachment/media/90008_181118_002.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <%--<div class="item">--%>
          <%--<img src="data:image/gif;base64,R0lGODlhAQABAIAAAFVVVQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">--%>
          <%--<div class="container">--%>
            <%--<div class="carousel-caption">--%>
              <%--<h1>One more for good measure.</h1>--%>
              <%--<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>--%>
              <%--<p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>--%>
            <%--</div>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</div>--%>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->

            <c:forEach items="${boardList}" var="board" >
                <tr>
                    <td>${board.idx}</td>
                    <td>${board.id}</td>
                    <td>${board.name}</td>
                    <td>${board.delGb}</td>
                </tr>
                
            </c:forEach>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>