<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/tags/taglib.jsp" %>

        
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Charts</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Charts</li>
            </ol>
          </div>
          <!-- Row -->
          <div class="row">
            <!-- Bar Chart -->
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                  </div>
                  <hr>
                  Styling for the bar chart can be found in the <code>/js/demo/chart-bar-demo.js</code> file.
                </div>
              </div>
            </div>
          </div>
          <!--Row-->

          <!-- Documentation Link -->
        </div>
        <!---Container Fluid-->
      </div>
