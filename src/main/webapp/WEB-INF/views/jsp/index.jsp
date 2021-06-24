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
  <link rel="stylesheet" href="/css/custom.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css" />

  <script src="/webjars/jquery/3.5.1/jquery.js"></script>
  <script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>

  <!-- Page JS -->
  <script>
    $(document).ready(function () {
      $("#exampleTable").DataTable({
        "serverSide": true,
        "processing": true,
        "ajax": {
          "url": "/api/get",
          "type": "GET",
          "data": function (res) {
            console.log(res);
            var data = res.data;
            return data;
          }
        },
        "columns": [{
            "data": "seq"
          },
          {
            "data": "name"
          },
          {
            "data": "age"
          },
          {
            "data": "date"
          },
        ]

      });
    });

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
    <table id="example" class="table table-striped table-bordered">
      <thead>
        <tr>
          <th scope="col">No</th>
          <th scope="col">게시글 종류</th>
          <th scope="col">제목</th>
          <th scope="col">내용</th>
          <th>
        </tr>
      </thead>
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
    <!-- End Modal -->
  </main>
  <!-- End Main -->
</body>

</html>