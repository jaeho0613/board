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
  <link rel="stylesheet" href="/css/custom.css">

  <!-- Page JS -->
  <script>
    /**
     * modalOpenButtonEvent
     * 
     * @Param {seq} 0 = 글 추가,
     */
    function modalOpenButtonEvent(seq) {
      var $modal = $(".modal");

      if (seq == 0) {
        $modal.find("h5.modal-title").text("게시글 추가");
        return;
      }

      $modal.find("h5.modal-title").text("게시글 수정");
      $modal.find("form").attr("action", "main/modify/" + seq);

      $.ajax({
        url: '/api/get/' + seq,
        type: 'GET',
        success: function (result) {
          $modal.find("input[name='title']").val(result.title);
          $modal.find("textarea[name='description']").val(result.description);
          if (result.boardTypeCd == '11') {
            $modal.find("select[name='boardTypeCd']").val('11').prop("selected", true);
          } else {
            $modal.find("select[name='boardTypeCd']").val('12').prop("selected", true);
          }
        }
      });
    }
  </script>
</head>

<body>
  <!-- Main list content -->
  <main class="container mt-3">

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#exampleModal"
      onclick="modalOpenButtonEvent(0)">
      게시글 추가
    </button>

    <!-- Show Board Table -->
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">No</th>
          <th scope="col">게시글 종류</th>
          <th scope="col">제목</th>
          <th scope="col">내용</th>
          <th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${ boardList }" var="board" varStatus="st">
          <tr>
            <td>${ st.count }</td>
            <td>${ board.boardTypeCd }</td>
            <td>${ board.title }</td>
            <td>${ board.description }</td>
            <td>
              <button type="button" class="btn btn-danger"
                onclick="location.href='/main/delete/${ board.contentSeq }'">삭제
              </button>
              <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal"
                onclick="modalOpenButtonEvent(${ board.contentSeq })">
                수정
              </button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

          <!-- input form -->
          <form action="/main/addBoard" method="POST" id="boardData" enctype="multipart/form-data">
            <div class="modal-body">
              <div class="form-group">
                <label>제목</label>
                <input name="title" type="text" class="form-control board_title" placeholder="제목">
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">게시글 종류</label>
                <select name="boardTypeCd" class="form-control board_type_cd" id="exampleFormControlSelect1">
                  <option>11</option>
                  <option>12</option>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">내용</label>
                <textarea name="description" class="form-control board_description" id="exampleFormControlTextarea1"
                  rows="3" placeholder="내용"></textarea>
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
</body>

</html>