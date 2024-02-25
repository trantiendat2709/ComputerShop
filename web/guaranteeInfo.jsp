<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : guaranteeInfo
    Created on : May 22, 2023, 3:04:54 PM
    Author     : vinh1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <head>
        <title>Chi tiết đơn hàng | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="logout?page=login.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user">
                <img class="app-sidebar__user-avatar" src="image1/${acc.getImg()}" width="30px"
                     alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${acc.getAdminName()}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
                <div>
                    <form action="adminaccount">
                        <input type="hidden" name="id" value="${acc.getAdminID()}">
                        <button type="submit" class="btn btn-primary mt-2" name="btno" value="0">Thay đổi</button>
                    </form>
                </div>
            </div>
            <hr>
            <ul class="app-menu" id="menu_info">
                <li><a class="app-menu__item haha" href="AdminHome.jsp"></i><i class='app-menu__icon bx bxs-home' ></i>
                        <span class="app-menu__label">Trang chủ Home</span></a></li>
                        <c:if test="${acc.getRoleID() == 1}">
                    <li><a class="app-menu__item" href="adminstaff"><i class='app-menu__icon bx bx-user-voice'></i>
                            <span class="app-menu__label">Quản lý nhân viên</span></a></li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/userAdmin"><i class='app-menu__icon bx bx-user'></i><span
                                class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/productAdmin"><i
                                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                    </li>
                    <li><a class="app-menu__item" href="list-blog-admin"><i class='app-menu__icon bx bx-news'></i><span
                                class="app-menu__label">Quản lý tin tức</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=1"><i class='app-menu__icon bx bx-task'></i><span
                                class="app-menu__label">Quản lý đơn hàng</span></a></li>
                    <li><a class="app-menu__item" href="guarantee"><i class='app-menu__icon bx bx-shield-alt-2'></i><span
                                class="app-menu__label">Quản lý bảo hành
                            </span></a></li>
                        </c:if>
                        <c:if test="${acc.getRoleID() == 2}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/addblog">
                            <i class='app-menu__icon bx bx-add-to-queue'></i><span class="app-menu__label">Tạo Blog Mới</span></a>
                    </li>
                    <li><a class="app-menu__item" href="list-blog-admin"><i class='app-menu__icon bx bx-news'></i><span
                                class="app-menu__label">Quản lý tin tức</span></a></li>
                            </c:if>
                            <c:if test="${acc.getRoleID() == 3}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/addProductAdmin">
                            <i class='app-menu__icon bx bx-add-to-queue'></i><span class="app-menu__label">Tạo mới sản phẩm</span></a>
                    </li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/productAdmin">
                            <i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                    </li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/listDelete">
                            <i class='app-menu__icon bx bx-trash'></i><span class="app-menu__label">Sản phẩm đã xóa</span></a>
                    </li>
                </c:if>
                <c:if test="${acc.getRoleID() == 4}">
                    <li><a class="app-menu__item" href="tableaddorder"><i class='app-menu__icon bx bx-add-to-queue'></i><span
                                class="app-menu__label">Tạo mới đơn hàng</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=1"><i class='app-menu__icon bx bx-stopwatch'></i><span
                                class="app-menu__label">Đơn hàng đang xử lý</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=2"><i class='app-menu__icon bx bxs-truck'></i><span
                                class="app-menu__label">Đơn hàng đang giao</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=3"><i class='app-menu__icon bx bx-task'></i><span
                                class="app-menu__label">Đơn hàng đã giao</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=4"><i class='app-menu__icon bx bx-task-x'></i><span
                                class="app-menu__label">Đơn hàng đã hủy</span></a></li>
                            </c:if>
                            <c:if test="${acc.getRoleID() == 5}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/userAdmin"><i class='app-menu__icon bx bx-user'></i><span
                                class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/listUserDelete">
                            <i class='app-menu__icon bx bx-trash'></i><span class="app-menu__label">Người dùng đã xóa</span></a>
                    </li>
                </c:if>
                <c:if test="${acc.getRoleID() == 6}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/guaranteeAdd">
                            <i class='app-menu__icon bx bx-add-to-queue'></i><span class="app-menu__label">Tạo mới bảo hành</span></a>
                    </li>
                    <li><a class="app-menu__item" href="guarantee"><i class='app-menu__icon bx bx-shield-alt-2'></i><span
                                class="app-menu__label">Quản lý bảo hành
                            </span></a></li>
                        </c:if>
                <li><a class="app-menu__item" href="logout?page=login.jsp"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Đăng xuất</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="ordermanager">Danh sách bảo hành</a></li>
                    <li class="breadcrumb-item"><a href="orderdetailmanagement">Chi tiết bảo hành</a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="form-head d-flex justify-content-between align-items-center">
                <div class="me-auto d-none d-lg-block">
                    <h2 class="text-black font-w600 mb-0">Mã seri sản phẩm: ${info.getSeri()}</h2>
                </div>

            </div>                   
            <div class="col-xl-12 col-xxl-12 col-lg-12 col-md-12">
                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Ảnh</div>
                            <div class="card-body text-center">
                                <!-- Profile picture image-->
                                <img id="output" style="object-fit: cover;width: 315px;height: 315px;"
                                     class="img-account-profile rounded-circle mb-2"
                                     src="/SWP391_LapTop/image1/${acc.getImg()}" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-body pt-2">
                                <form id="frm" method="post" action="adminaccount" enctype="multipart/form-data">
                                    <!-- Account details card-->
                                    <div class=card mb-12">
                                        <!--(username)-->
                                        <div class="card-header">Thông tin khách hàng</div>
                                        <div class="card-body">
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1">Tên khách hàng:</label>
                                                <input  class="form-control"  type="text" value="${info.getUserName()}" readonly>
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1">Email</label>
                                                    <input class="form-control"  type="text" value="${info.getEmail()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1">Số điện thoại</label>
                                                    <input class="form-control" value="${info.getPhone()}" readonly>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1">Địa chỉ:</label>
                                                <input  class="form-control"  type="text" value="${info.getAddress()}" readonly>
                                            </div>
                                            <!--end(username)-->
                                        </div>

                                    </div>      
                            </div>
                            </form>
                            <!--End bang thong tin-->
                        </div>   
                        <div class="card">
                            <div class="card-body pt-2">
                                <form id="frm" method="post" action="adminaccount" enctype="multipart/form-data">
                                    <!-- Account details card-->
                                    <div class=card mb-12">
                                        <!--(username)-->
                                        <div class="card-header">Thông tin người tạo đơn bảo hành </div>
                                        <div class="card-body">
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1">Tên người tạo:</label>
                                                <input  class="form-control"  type="text" value="${info.getAdminName()}" readonly>
                                            </div>                                            
                                            <!--end(adminname)-->
                                        </div>

                                    </div>      
                            </div> 
                        </div>



                        <div class="card">
                            <div class="card-body pt-2">
                                <form id="frm" method="post" action="adminaccount" enctype="multipart/form-data">
                                    <!-- Account details card-->
                                    <div class=card mb-12">                                           
                                        <!--(guarantee)-->
                                        <div class="card-header">Thông tin bảo hành</div>    
                                        <div class="card-body">
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1">Tên sản phẩm:</label>
                                                <input  class="form-control"  type="text" value="${info.getProductName()}" readonly>
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1">Ngày bắt đầu</label>
                                                    <input class="form-control"  type="text" value="${info.getStartDate()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1">ID bảo hành cũ</label>
                                                    <c:if test="${info.getOldGuaranteeID()==0}">                                                    
                                                        <input class="form-control" value="Không có" readonly>
                                                    </div>
                                                </c:if>
                                                <c:if test="${info.getOldGuaranteeID()!=0}">                                                    
                                                    <input class="form-control" value="${info.getStartDate()}" readonly>
                                                </div>
                                            </c:if>
                                            <c:if test="${info.getOldGuaranteeID()!=0}">
                                                <h4>ID bảo hành cũ: ${info.getStartDate()}</h4>
                                            </c:if>


                                            <div class="col-md-6">
                                                <label class="small mb-1">Ảnh mô tả bảo hành</label>
                                                <img style="object-fit: cover;width: 315px;height: 315px;" src="imageGuarantee/${info.getImg()}" alt="avatar">

                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="small mb-1">Mô tả bảo hành</label>
                                            <input  class="form-control"  type="text" value="${info.getDes_Error()}" readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="small mb-1">Trạng thái</label>
                                        </div>
                                        <c:if test="${info.getStatus() == 'worked'}">
                                            <td class="text-center"><span class="btn btn-sm light btn-danger">Đang Bảo Hành</span></td>
                                        </c:if>
                                        <c:if test="${info.getStatus() == 'working'}">
                                            <td class="text-center"><span class="btn btn-sm light btn-success">Hoàn Thành</span></td>
                                        </c:if>  
                                        </br></br>

                                        <button class="btn btn-primary btn-sm trash" type="button" title="Hủy Bảo Hành" data-id ="${info.getGuaranteeID()}"
                                                data-status ="worked" data-path ="${pageContext.request.contextPath}" data-page ="${page}"
                                                data-num ="${num}" data-key ="${key}" data-entryperpage ="${entryperpage}"
                                                data><i class="fas fa-trash-alt"></i> </button>
                                        <button class="btn btn-primary btn-sm check" type="button" title="Xác nhận Hoàn Thành" data-id ="${info.getGuaranteeID()}"
                                                data-status ="working" data- data-path ="${pageContext.request.contextPath}" data-page ="${page}"
                                                data-num ="${num}" data-key ="${key}" data-entryperpage ="${entryperpage}"
                                                data><i class="fa fa-check"></i></button>
                                        <a class="btn btn-primary light btn-xs" href="guaranteeCreatePDF">Xuất file PDF</a>       
                                        <h2 style="color: red">${errorPDF}</h2>
                                        <!--end(guarantee)-->

                                    </div>      
                            </div>
                            </form>
                            <!--End bang thong tin-->
                        </div>
                    </div>
                </div>
            </div>


            
        </div>
    </div>
</div>
</main>
<!-- Essential javascripts for application to work-->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script>
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }
    function getPa(orderID, path, status, page, num, key, entryperpage) {
        window.location.href = path + "/guaranteeUpdate?guaranteeID=" + orderID + "&status=" + status + "&web=guaranteeInfo";
    }
    jQuery(function () {
        jQuery(".trash").click(function () {
            var orderID = $(this).data("id");
            var status = $(this).data("status");
            var path = $(this).data("path");
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn là muốn hủy bỏ đơn hàng này?",
                buttons: ["Hủy bỏ", "Đồng ý"]
            })
                    .then((willDelete) => {
                        if (willDelete) {
                            swal("Đã hủy thành công!", {
                            })
                                    .then(function () {
                                        getPa(orderID, path, status);
                                    });
                        }
                    });

        });
    });

    jQuery(function () {
        jQuery(".check").click(function () {
            var orderID = $(this).data("id");
            var status = $(this).data("status");
            var path = $(this).data("path");
            swal("Xác thực thành công!", {
            })
                    .then(function () {
                        getPa(orderID, path, status);
                    });
        });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });
    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");
        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
    //In dữ liệu
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('sampleTable');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({backdrop: false, keyboard: false})
    })
            ;
</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
</body>

</html>

