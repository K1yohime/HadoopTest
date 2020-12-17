<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>大数据电影分析</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/echarts.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function login() {
	 // 基于准备好的dom，初始化echarts实例
     var myChartradar1 = echarts.init(document.getElementById('main2'));
	 var username=document.getElementById("username").value
	 //alert(username)
     $.get('${pageContext.request.contextPath}/EmpServlet?param=radar&username='+username).done(function (data) {
    	
    	//alert(data)
    	var data =$.parseJSON(data);
        //console.log(typeof(data));
			 console.log(data.dname);
			 //alert(data)
			 var filmtype = ['爱情', '动作', '犯罪', '恐怖', '喜剧', '悬疑']
			 var score=[]
			 var dname=[]
			 var i = 0
			 var j = 0
			 //alert(data.length)
			 for(;i<data.length;){
				 for(;j<filmtype.length;) {
					 var str1 = data[i].ftype
					 //alert(str1)
					 var str2 = filmtype[j]
					 //alert(str1==str2)
					 if(str1==str2) {
						 score[j] = data[i].score;
						 i ++;
						 j ++;
						 break;
						 //alert(data[i].score)
					 }else {
						 score[j] = 0;
						 j ++;
					 }
				 }
				 
//				 console.log(i)
//				 score[i] = data[i].score;
//				dname[i] = data[i].dname;
			 }
			 //alert(1111111111111111111)
			 //alert(score)
			for(i=0;i<1;i++){
				 console.log(i)
				 dname[i] = data[i].dname;
			 }
			//alert(dname)
			console.log(dname)
			console.log(score)
         // 填入数据
         myChartradar.setOption({
         	series: [{
     	        name: '',
     	        type: 'radar',
     	        // areaStyle: {normal: {}},
     	        data: [
     	            {
     	                value: score,
     	                name: dname
     	            }
     	            
     	        ]
     	    }]
     });
    	
    })
   

}
</script>
	
<body id="reportsPage">
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand">
                    <h1 class="tm-site-title mb-0">大数据电影分析</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!--
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="fas fa-tachometer-alt"></i>
                                展示
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                    </ul>
                    -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="logintest.jsp">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                    
                </div>
            </div>

        </nav>
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">欢迎回来, <b>${sessionScope.username}</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">革命机评分随时间的变化</h2>
                        

                        <div id="mian1" style="width: 500px;height:350px;"></div>
    
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                    	<div class="row tm-content-row">
                    		<div class="col-sm-12 col-md-12 col-lg-7 col-xl-7 tm-block-col">
	                        <h2 class="tm-block-title">导演拍摄不同电影类型的评分</h2>
	                        </div>
	                        <div class="col-sm-12 col-md-12 col-lg-5 col-xl-5 tm-block-col">
	                        <form id="form1" action="##" method="post" class="tm-login-form">
	                        <div class="input-group mb-3">
							  <input type="text" name="value" id="username" class="form-control" aria-describedby="button-addon2">
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary" type="button" onclick="login()" id="button-addon2">搜索</button>
							  </div>
							</div>
	                        </form>
	                        
	                        </div>
						</div>
                        <div id="main2" style="width: 500px;height:300px;"></div>
                        
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller">
                        <h2 class="tm-block-title">19年各月份上映不同电影类型的数量</h2>
                        <div id="main3" style="width: 500px;height:400px;"></div>
                       
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                        <h2 class="tm-block-title">五种类型电影评分随时间的变化</h2>
                        <div id="main4" style="width: 500px;height:300px;"></div>
                        
                        </div>
                    </div>
                </div>
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">代表地区盛产电影类型及数量</h2>
                        <div id="main5" style="width: 1000px;height:300px;"></div>
                    </div>
                </div>
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark   tm-block-scroll" style="padding: 50px"">
                        <h2 class="tm-block-title">电影名最常出现词汇</h2>
                        <img src="img/ciyun.png"; style="width: 100%;height: 100%;margin-top: -250px;margin-bottom: -250px ">
                        
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <div>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    
    <script src="js/echarts.js"></script>
    <script src="js/bmap.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/getscript?v=2.0&ak=6Ed9j1gygoqcHiTGQKt7hM9IevcfLxPW"></script>
<!--    <script>
        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart;
        barChart, pieChart;
        // DOM is ready
        $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart

            $(window).resize(function () {
                updateLineChart();
                updateBarChart();                
            });
        })
    </script>
-->    

		
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChartline = echarts.init(document.getElementById('mian1'));

        // 指定图表的配置项和数据
        myChartline.setOption({
			xAxis: {
		        type: 'category',
		        data: []
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: [],
		        type: 'line'
		    }]
        });
        myChartline.showLoading();
        // 异步加载数据  $  jQuery
        $.get('${pageContext.request.contextPath}/EmpServlet?param=line').done(function (data) {
        	myChartline.hideLoading();
       // alert(data)
       // console.log(data[0]);
           var data =$.parseJSON(data);
           //console.log(typeof(data));
   			 //console.log(data[0]);
   			
   			 var year=[]
   			 var score=[]
   			 //console.log(data.length)
   			 for(i=0;i<data.length;i++){
   				 console.log(i)
   				 year[i] = data[i].year;
   				 score[i] = data[i].score;
   			 }
   			console.log(year)
   			console.log(score)
            // 填入数据
            myChartline.setOption({
            	xAxis: {
    		        type: 'category',
    		        data: year
    		    },
    		    yAxis: {
    		        type: 'value'
    		    },
    		    series: [{
    		        data: score,
    		        type: 'line'
    		    }]
            });
        });
        
		


		// 使用刚指定的配置项和数据显示图表。
		//myChartline.setOption(option);
    </script>
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChartradar = echarts.init(document.getElementById('main2'));

        // 指定图表的配置项和数据
        myChartradar.setOption({
        	title: {
    	        text: ''
    	    },
    	    tooltip: {},
    	    legend: {
    	        data: ['']
    	    },
    	    
    	    radar: {
    	        // shape: 'circle',
    	        name: {
    	            textStyle: {
    	                color: '#fff',
    	                backgroundColor: '#999',
    	                borderRadius: 3,
    	                padding: [3, 5]
    	            }
    	        },
    	        indicator: [
    	            { name: '爱情', max: 10},
    	            { name: '动作', max: 10},
    	            { name: '犯罪', max: 10},
    	            { name: '恐怖', max: 10},
    	            { name: '喜剧', max: 10},
    	            { name: '悬疑', max: 10}
    	        ]
    	    },
    	    series: [{
    	        name: '',
    	        type: 'radar',
    	        // areaStyle: {normal: {}},
    	        data: [
    	            {
    	                value: [],
    	                name: ''
    	            }
    	            
    	        ]
    	    }]
        });
        
        myChartradar.showLoading();
        // 异步加载数据  $  jQuery
        $.get('${pageContext.request.contextPath}/EmpServlet?param=radar').done(function (data) {
        	myChartradar.hideLoading();
       // alert(data)
       // console.log(data[0]);
           var data =$.parseJSON(data);
           //console.log(typeof(data));
   			 //console.log(data[0]);
   			
   			 var filmtype = ['爱情', '动作', '犯罪', '恐怖', '喜剧', '悬疑']
   			 var score=[]
   			 var dname=[]
   			 var i = 0
   			 var j = 0
   			 //console.log(data.length)
   			 for(;i<data.length;){
   				 for(;j<filmtype.length;) {
   					 var str1 = data[i].ftype
   					 var str2 = filmtype[j]
   					 if(str1==str2) {
   						 score[j] = data[i].score;
   						 i ++;
   						 j ++;
   						 break;
   					 }else {
   						 score[j] = 0;
   						 j ++;
   					 }
   				 }
//   				 console.log(i)
//   				 score[i] = data[i].score;
//   				dname[i] = data[i].dname;
   			 }
   			for(i=0;i<1;i++){
  				 console.log(i)
  				 dname[i] = data[i].dname;
  			 }
   			console.log(dname)
   			console.log(score)
            // 填入数据
            myChartradar.setOption({
            	series: [{
        	        name: '',
        	        type: 'radar',
        	        // areaStyle: {normal: {}},
        	        data: [
        	            {
        	                value: score,
        	                name: dname
        	            }
        	            
        	        ]
        	    }]
        });
            
        });


        // 使用刚指定的配置项和数据显示图表。
        //myChart.setOption(option);
    </script>
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChartheatmap = echarts.init(document.getElementById('main3'));

        // 指定图表的配置项和数据
        var month = ['1', '2', '3', '4', '5', '6', '7','8', '9', '10','11','12'];
        var ftype = ['传记', '动作', '动画','喜剧', '悬疑', '犯罪', '科幻'];

        var data = [];

        data = data.map(function (item) {
            return [item[1], item[0], item[2] || '-'];
        });
        
        myChartheatmap.setOption({
                    tooltip: {
                        position: 'top'
                    },
                    animation: false,
                    grid: {
                        height: '50%',
                        top: '10%'
                    },
                    xAxis: {
                        type: 'category',
                        data: month,
                        splitArea: {
                            show: true
                        }
                    },
                    yAxis: {
                        type: 'category',
                        data: ftype,
                        splitArea: {
                            show: true
                        }
                    },
                    visualMap: {
                        min: 0,
                        max: 30,
                        calculable: true,
                        orient: 'horizontal',
                        left: 'center',
                        bottom: '15%'
                    },
                    series: [{
                        name: 'Punch Card',
                        type: 'heatmap',
                        data: data,
                        label: {
                            show: true
                        },
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 10,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }]
        });
        
        myChartheatmap.showLoading();
        // 异步加载数据  $  jQuery
        $.get('${pageContext.request.contextPath}/EmpServlet?param=heatmap').done(function (data) {
        	myChartheatmap.hideLoading();
       // alert(data)
       // console.log(data[0]);
           var data =$.parseJSON(data);
           //console.log(typeof(data));
   			 //console.log(data[0]);
   			
   			 var count=[]
   			 var demo=[]
   			 var test=[]
   			 //console.log(data.length)
  			 for(i=0;i<data.length;i++){
   				 console.log(i)
   				 demo[i] = data[i].count;
   			 }
  			 var i=0
 			 var j=0
   			 
   			for(;i<7;i++){
 				var k = i;
 				j=0;
   				for(;j<12;j++){
   					
   					test[0]=j;
					test[1]=i;
   					test[2]=demo[k];
   					count.push(test);
   					k+=7;
  					test = [];
   				}
   			}
//   	    console.log(count)
   			console.log(count)
            // 填入数据
            myChartheatmap.setOption({
            	series: [{
                    name: 'Punch Card',
                    type: 'heatmap',
                    data: count,
                    label: {
                        show: true
                    },
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }]
            });
        });


        // 使用刚指定的配置项和数据显示图表。
        //myChart.setOption(option);
    </script>
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChartstackedline = echarts.init(document.getElementById('main4'));

        // 指定图表的配置项和数据
        myChartstackedline.setOption({
        	tooltip: {
    	        trigger: 'axis'
    	    },
    	    legend: {
    	        data: ['动作', '动画', '喜剧', '悬疑', '科幻']
    	    },
    	    grid: {
    	        left: '3%',
    	        right: '4%',
    	        bottom: '3%',
    	        containLabel: true
    	    },
    	    toolbox: {
    	        feature: {
    	            saveAsImage: {}
    	        }
    	    },
    	    xAxis: {
    	        type: 'category',
    	        boundaryGap: false,
    	        data: []
    	    },
    	    yAxis: {
    	        type: 'value'
    	    },
    	    series: [
    	        {
    	            name: '动作',
    	            type: 'line',
    	            stack: '总量',
    	            data: []
    	        },
    	        {
    	            name: '动画',
    	            type: 'line',
    	            stack: '总量',
    	            data: []
    	        },
    	        {
    	            name: '喜剧',
    	            type: 'line',
    	            stack: '总量',
    	            data: []
    	        },
    	        {
    	            name: '悬疑',
    	            type: 'line',
    	            stack: '总量',
    	            data: []
    	        },
    	        {
    	            name: '科幻',
    	            type: 'line',
    	            stack: '总量',
    	            data: []
    	        }
    	    ]
            });
        
        myChartstackedline.showLoading();
        // 异步加载数据  $  jQuery
        $.get('${pageContext.request.contextPath}/EmpServlet?param=stackedline').done(function (data) {
        	myChartstackedline.hideLoading();
       // alert(data)
       // console.log(data[0]);
           var data =$.parseJSON(data);
           //console.log(typeof(data));
   			 //console.log(data[0]);
   			
   			 var year=[2011,2012,2013,2014,2015,2016,2017,2018,2019,2020]
   			 var score=[]
   			 
   			 var demo=[]
   			 var test=[]
   			 
   			 var k=0
   			 //console.log(data.length)
   			 for(i=0;i<data.length;i++){
   				 console.log(i)
   				 
   				 score[i] = data[i].score;
   			 }
   			 
   			for(i = 0; i < 5; i++) {
   				for (j = i; j < score.length; j += 5) {
   					test[k] = score[j].toFixed(1);
   					k++;
   				}
   				demo[i] = test;
   				test = [];
   				k = 0;
   			}

   			 var data1=demo[0]
  			 var data2=demo[1]
  			 var data3=demo[2]
  			 var data4=demo[3]
  			 var data5=demo[4]
   			 
   			console.log(year)
   			console.log(score)
            // 填入数据
            myChartstackedline.setOption({
            	xAxis: {
        	        type: 'category',
        	        boundaryGap: false,
        	        data: year
        	    },
        	    yAxis: {
        	        type: 'value'
        	    },
        	    series: [
        	        {
        	            name: '动作',
        	            type: 'line',
        	            stack: '总量',
        	            data: data1
        	        },
        	        {
        	            name: '动画',
        	            type: 'line',
        	            stack: '总量',
        	            data: data2
        	        },
        	        {
        	            name: '喜剧',
        	            type: 'line',
        	            stack: '总量',
        	            data: data3
        	        },
        	        {
        	            name: '悬疑',
        	            type: 'line',
        	            stack: '总量',
        	            data: data4
        	        },
        	        {
        	            name: '科幻',
        	            type: 'line',
        	            stack: '总量',
        	            data: data5
        	        }
        	    ]
            });
        });



        // 使用刚指定的配置项和数据显示图表。
        //myChart.setOption(option);
    </script>
    
    
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main5'));

        // 指定图表的配置项和数据
        
       var data = [
    {name: '大陆-剧情', value: 260},
    {name: '大陆-喜剧', value: 158},
    {name: '大陆-动作', value: 129},
    
    {name: '美国-剧情', value: 393},
    {name: '美国-惊悚', value: 251},
    {name: '美国-动作', value: 214},
    {name: '美国-喜剧', value: 199},
    {name: '美国-冒险', value: 144},
    
    {name: '英国-剧情', value: 92},
    {name: '英国-惊悚', value: 65},
    {name: '英国-动作', value: 56},
    
    {name: '西班牙-剧情', value: 19},
    {name: '西班牙-惊悚', value: 10},
    {name: '西班牙-喜剧', value: 9},
    
    {name: '韩国-剧情', value: 54},
    {name: '韩国-动作', value: 30},
    {name: '韩国-犯罪', value: 21},
    
    {name: '香港-剧情', value: 70},
    {name: '香港-动作', value: 55},
    {name: '香港-犯罪', value: 31},
    {name: '香港-喜剧', value: 28},
    
    {name: '泰国-动作', value: 4},
    {name: '泰国-剧情', value: 3},
    {name: '泰国-喜剧', value: 3},
    
    {name: '法国-剧情', value: 76},
    {name: '法国-喜剧', value: 27},
    {name: '法国-惊悚', value: 22},
    
    {name: '日本-剧情', value: 139},
    {name: '日本-爱情', value: 51},
    {name: '日本-喜剧', value: 44},
    
    {name: '意大利-剧情', value: 43},
    {name: '意大利-惊悚', value: 22},
    {name: '意大利-动作', value: 20},
    
    {name: '台湾-剧情', value: 23},
    {name: '台湾-爱情', value: 8},
    
    {name: '印度-剧情', value: 26},
    {name: '印度-喜剧', value: 16},
    {name: '印度-动作', value: 13},
    
    {name: '加拿大-剧情', value: 29},
    {name: '加拿大-惊悚', value: 26},
    {name: '加拿大-科幻', value: 17}
];
var geoCoordMap = {
		'大陆-剧情':[116.46,39.92],
	    '大陆-喜剧':[116.46,38.92],
	    '大陆-动作':[116.46,37.92],
	    
	    '美国-剧情':[-77.02,40.94],
	    '美国-惊悚':[-77.02,39.94],
	    '美国-动作':[-77.02,38.94],
	    '美国-喜剧':[-77.02,37.94],
	    '美国-冒险':[-77.02,36.94],
	    
	    '英国-剧情':[0.5,52.80],
	    '英国-惊悚':[0.5,52.30],
	    '英国-动作':[0.5,51.80],
	    
	    '西班牙-剧情':[-3.45,41.25],
	    '西班牙-惊悚':[-3.45,40.25],
	    '西班牙-喜剧':[-3.45,39.25],
	    
	    '韩国-剧情':[127.03,38.35],
	    '韩国-动作':[127.03,37.35],
	    '韩国-犯罪':[127.03,36.35],
	    
	    '香港-剧情':[114.15,22.75],
	    '香港-动作':[114.15,22.55],
	    '香港-犯罪':[114.15,22.35],
	    '香港-喜剧':[114.15,22.15],
	    
	    '泰国-动作':[100.31,14.45],
	    '泰国-剧情':[100.31,13.45],
	    '泰国-喜剧':[100.31,12.45],
	    
	    '法国-剧情':[2.20,49.01],
	    '法国-喜剧':[2.20,48.51],
	    '法国-惊悚':[2.20,48.01],
	    
	    '日本-剧情':[139.44,35.91],
	    '日本-爱情':[139.44,35.41],
	    '日本-喜剧':[139.44,34.91],
	    
	    '意大利-剧情':[12.50,42.30],
	    '意大利-惊悚':[12.50,41.80],
	    '意大利-动作':[12.50,41.30],
	    
	    '台湾-剧情':[121.56,24.03],
	    '台湾-爱情':[121.56,23.83],
	    
	    '印度-剧情':[77.13,28.87],
	    '印度-喜剧':[77.13,28.37],
	    '印度-动作':[77.13,27.87],
	    
	    '加拿大-剧情':[-75.58,45.70],
	    '加拿大-惊悚':[-75.58,45.20],
	    '加拿大-科幻':[-75.58,44.70],
   
};

var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var geoCoord = geoCoordMap[data[i].name];
        if (geoCoord) {
            res.push({
                name: data[i].name,
                value: geoCoord.concat(data[i].value)
            });
        }
    }
    return res;
};

option = {
    title: {
        //text: '全国主要城市空气质量 - 百度地图',
        //subtext: 'data from PM25.in',
        sublink: 'http://www.pm25.in',
        left: 'center'
    },
    tooltip : {
        trigger: 'item'
    },
    bmap: {
        center: [104.114129, 37.550339],
        zoom: 5,
        roam: true,
        mapStyle: {
            styleJson: [{
                'featureType': 'water',
                'elementType': 'all',
                'stylers': {
                    'color': '#d1d1d1'
                }
            }, {
                'featureType': 'land',
                'elementType': 'all',
                'stylers': {
                    'color': '#f3f3f3'
                }
            }, {
                'featureType': 'railway',
                'elementType': 'all',
                'stylers': {
                    'visibility': 'off'
                }
            }, {
                'featureType': 'highway',
                'elementType': 'all',
                'stylers': {
                    'color': '#fdfdfd'
                }
            }, {
                'featureType': 'highway',
                'elementType': 'labels',
                'stylers': {
                    'visibility': 'off'
                }
            }, {
                'featureType': 'arterial',
                'elementType': 'geometry',
                'stylers': {
                    'color': '#fefefe'
                }
            }, {
                'featureType': 'arterial',
                'elementType': 'geometry.fill',
                'stylers': {
                    'color': '#fefefe'
                }
            }, {
                'featureType': 'poi',
                'elementType': 'all',
                'stylers': {
                    'visibility': 'off'
                }
            }, {
                'featureType': 'green',
                'elementType': 'all',
                'stylers': {
                    'visibility': 'off'
                }
            }, {
                'featureType': 'subway',
                'elementType': 'all',
                'stylers': {
                    'visibility': 'off'
                }
            }, {
                'featureType': 'manmade',
                'elementType': 'all',
                'stylers': {
                    'color': '#d1d1d1'
                }
            }, {
                'featureType': 'local',
                'elementType': 'all',
                'stylers': {
                    'color': '#d1d1d1'
                }
            }, {
                'featureType': 'arterial',
                'elementType': 'labels',
                'stylers': {
                    'visibility': 'off'
                }
            }, {
                'featureType': 'boundary',
                'elementType': 'all',
                'stylers': {
                    'color': '#fefefe'
                }
            }, {
                'featureType': 'building',
                'elementType': 'all',
                'stylers': {
                    'color': '#d1d1d1'
                }
            }, {
                'featureType': 'label',
                'elementType': 'labels.text.fill',
                'stylers': {
                    'color': '#999999'
                }
            }]
        }
    },
    series : [
        {
            //name: 'pm2.5',
            type: 'scatter',
            coordinateSystem: 'bmap',
            data: convertData(data),
            symbolSize: function (val) {
                return val[2] / 10;
            },
            encode: {
                value: 2
            },
            label: {
                formatter: '{b}',
                position: 'right',
                show: false
            },
            itemStyle: {
                color: 'purple'
            },
            emphasis: {
                label: {
                    show: true
                }
            }
        },
        {
            //name: '',
            type: 'effectScatter',
            coordinateSystem: 'bmap',
            data: convertData(data.sort(function (a, b) {
                return b.value - a.value;
            }).slice(0, 6)),
            symbolSize: function (val) {
                return val[2] / 10;
            },
            encode: {
                value: 2
            },
            showEffectOn: 'render',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            label: {
                formatter: '{b}',
                position: 'right',
                show: true
            },
            itemStyle: {
                color: 'purple',
                shadowBlur: 10,
                shadowColor: '#333'
            },
            zlevel: 1
        }
    ]
};


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>

