<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css">
  <script src="/webjars/jquery/3.5.1/jquery.js"></script>
  <script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">간단한 게시판</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">홈 <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">링크</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            드롭다운
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">아무</a>
            <a class="dropdown-item" href="#">것도</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">없다</a>
          </div>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>

  <main class="container mt-5">
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Board_Type_Cd</th>
          <th scope="col">Title</th>
          <th scope="col">Description</th>
          <th scope="col"> </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${ boardList }" var="board" varStatus="st">
          <tr>
            <td>${ st.count }</td>
            <td>${ board.boardTypeCd }</td>
            <td>${ board.title }</td>
            <td>${ board.description }</td>
            <td><button type="button" class="btn btn-danger" onclick="location.href='/main/delete/${ board.contentSeq }'">삭제</button></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
      글 추가
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">새로운 글</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form action="/main/addBoard" method="POST" id="boardData" enctype="multipart/form-data">
            <div class="modal-body">
              <div class="form-group">
                <label>Title</label>
                <input name="title" type="text" class="form-control" placeholder="제목">
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Board_Type_Cd</label>
                <select name="boardTypeCd" class="form-control" id="exampleFormControlSelect1">
                  <option>11</option>
                  <option>12</option>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Description</label>
                <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용"></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </main>

  <script>
    function submitform() {
      var data = $("#boardData").serialize();

      console.log("submit!!");
      console.log(data);

      $.ajax({
        type : 'POST',
        host : 'localhost:8088',
        url : '/main/addBoard',
        contentType : 'application/json',
        data : data
      })
    }
  </script>

</body>

</html>