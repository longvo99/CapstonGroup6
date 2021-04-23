<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/tags/taglib.jsp"%>


<!-- Container Fluid-->
<div class="container-fluid" id="container-wrapper">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Charts</li>
		</ol>
	</div>
	<!-- Row -->
	<div class="row">
		<!-- Bar Chart -->
		<div class="col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3 text-center">
					<h3 class="m-0 font-weight-bold text-primary">DOANH THU TỪNG
						THÁNG (NĂM ${year})</h3>
					<div class="dropdown mb-3">
						<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Năm ${year}</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<c:if test="${not empty listYear}">
								<c:forEach var="obj" items="${listYear}">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/admin/statistical/index/${obj}">Năm
										${obj}</a>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="chart-bar">
						<canvas id="myBarChart"></canvas>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<!--Row-->
	<div class="row">
		<div class="col-lg-12">
			<h3>
				<a
					href="${pageContext.request.contextPath}/admin/statistical/downloadExcel">Tổng
					doanh thu của từng địa điểm theo năm(Download Excel)</a>
			</h3>
		</div>
	</div>
	<!-- Documentation Link -->
</div>
<!---Container Fluid-->
</div>
<script type="text/javascript">
window.onload = function() {
	var totalPriceList = ${totalPriceList};
	var largesttotalPrice = ${largesttotalPrice};
	Chart.defaults.global.defaultFontFamily = 'Arial', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';
	function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
	      var k = Math.pow(10, prec);
	      return '' + Math.round(n * k) / k;
	    };
	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	  if (s[0].length > 3) {
	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	  }
	  if ((s[1] || '').length < prec) {
	    s[1] = s[1] || '';
	    s[1] += new Array(prec - s[1].length + 1).join('0');
	  }
	  return s.join(dec);
	}
	
	// Bar Chart Example
	//var availableTags = [500000000, 500000000, 500000000, 500000000, 500000000, 500000000];
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: ["Tháng 1", "Tháng 2", "Tháng3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
	    datasets: [{
	      backgroundColor: "#4e73df",
	      hoverBackgroundColor: "#000099",
	      borderColor: "#4e73df",
	      data: totalPriceList,
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 12
	        },
	        maxBarThickness: 25,
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: largesttotalPrice,
	          maxTicksLimit: 7,
	          padding: 5,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value) + 'VNĐ' ;
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: true,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      backgroundColor: "rgb(255, 255, 153)",
	      bodyFontColor: "#ff0000",
	      borderColor: '#ffff00',
	      borderWidth: 2,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return number_format(tooltipItem.yLabel) + ' VNĐ';
	        }
	      }
	    },
	  }
	});
 
}
</script>
