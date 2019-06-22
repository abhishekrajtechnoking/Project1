<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.json.simple.parser.JSONParser,java.io.BufferedReader
,java.io.BufferedWriter,java.io.OutputStreamWriter,java.io.IOException,java.io.InputStreamReader,
java.net.HttpURLConnection,java.net.URL,java.sql.*,org.json.simple.JSONArray,org.json.simple.JSONObject,
java.text.DateFormat,java.text.SimpleDateFormat,java.time.LocalDateTime,java.time.format.DateTimeFormatter,
 	java.util.Calendar,java.util.Date,java.time.LocalDate,
 	 	java.io.FileOutputStream,
java.io.StringReader,

com.itextpdf.text.Document,
com.itextpdf.text.PageSize,
com.itextpdf.text.html.simpleparser.HTMLWorker,
com.itextpdf.text.pdf.PdfWriter
"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Twitter -->
    <meta name="twitter:site" content="@themepixels">
    <meta name="twitter:creator" content="@themepixels">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Slim">
    <meta name="twitter:description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="twitter:image" content="http://themepixels.me/slim/img/slim-social.png">

    <!-- Facebook -->
    <meta property="og:url" content="http://themepixels.me/slim">
    <meta property="og:title" content="Slim">
    <meta property="og:description" content="Premium Quality and Responsive UI for Dashboard.">

    <meta property="og:image" content="http://themepixels.me/slim/img/slim-social.png">
    <meta property="og:image:secure_url" content="http://themepixels.me/slim/img/slim-social.png">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="600">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>Slim Responsive Bootstrap 4 Admin Template</title>

    <!-- vendor css -->
    <link href="../lib/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../lib/Ionicons/css/ionicons.css" rel="stylesheet">

    <!-- Slim CSS -->
    <link rel="stylesheet" href="../css/slim.css">
    
     <!-- style CSS -->
    <link rel="stylesheet" href="../css/style.css">

  </head>
  
  <body>
  	<form action="pdf1.jsp" method="post">
  
  		<%
  		try{
  			
  			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		    Date date = new Date();
	        //System.out.println(sdf.format(date));

	        Calendar cal = Calendar.getInstance();
	        String dt=sdf.format(cal.getTime());
  				  	
	        
	 
	        Document document = new Document(PageSize.LETTER);
	       
	        String str=request.getContextPath();
				
			
  	  	
  	  %>		
  		
    <div class="slim-header">
      <div class="container">
        <div class="slim-header-left">
          <h2 class="slim-logo"><a href="index.html">slim<span>.</span></a></h2>

          <div class="search-box">
            <input type="text" class="form-control" placeholder="Search">
            <button class="btn btn-primary"><i class="fa fa-search"></i></button>
          </div><!-- search-box -->
        </div><!-- slim-header-left -->
        <div class="slim-header-right">
          <div class="dropdown dropdown-a">
            <a href="" class="header-notification" data-toggle="dropdown">
              <i class="icon ion-ios-bolt-outline"></i>
            </a>
            <div class="dropdown-menu">
              <div class="dropdown-menu-header">
                <h6 class="dropdown-menu-title">Activity Logs</h6>
                <div>
                  <a href="">Filter List</a>
                  <a href="">Settings</a>
                </div>
              </div><!-- dropdown-menu-header -->
              <div class="dropdown-activity-list">
                <div class="activity-label">Today, December 13, 2017</div>
                <div class="activity-item">
                  <div class="row no-gutters">
                    <div class="col-2 tx-right">10:15am</div>
                    <div class="col-2 tx-center"><span class="square-10 bg-success"></span></div>
                    <div class="col-8">Purchased christmas sale cloud storage</div>
                  </div><!-- row -->
                </div><!-- activity-item -->
                <div class="activity-item">
                  <div class="row no-gutters">
                    <div class="col-2 tx-right">9:48am</div>
                    <div class="col-2 tx-center"><span class="square-10 bg-danger"></span></div>
                    <div class="col-8">Login failure</div>
                  </div><!-- row -->
                </div><!-- activity-item -->
                <div class="activity-item">
                  <div class="row no-gutters">
                    <div class="col-2 tx-right">7:29am</div>
                    <div class="col-2 tx-center"><span class="square-10 bg-warning"></span></div>
                    <div class="col-8">(D:) Storage almost full</div>
                  </div><!-- row -->
                </div><!-- activity-item -->
                <div class="activity-item">
                  <div class="row no-gutters">
                    <div class="col-2 tx-right">3:21am</div>
                    <div class="col-2 tx-center"><span class="square-10 bg-success"></span></div>
                    <div class="col-8">1 item sold <strong>Christmas bundle</strong></div>
                  </div><!-- row -->
                </div><!-- activity-item -->
                <div class="activity-label">Yesterday, December 12, 2017</div>
                <div class="activity-item">
                  <div class="row no-gutters">
                    <div class="col-2 tx-right">6:57am</div>
                    <div class="col-2 tx-center"><span class="square-10 bg-success"></span></div>
                    <div class="col-8">Earn new badge <strong>Elite Author</strong></div>
                  </div><!-- row -->
                </div><!-- activity-item -->
              </div><!-- dropdown-activity-list -->
              <div class="dropdown-list-footer">
                <a href="page-activity.html"><i class="fa fa-angle-down"></i> Show All Activities</a>
              </div>
            </div><!-- dropdown-menu-right -->
          </div><!-- dropdown -->
          <div class="dropdown dropdown-b">
            <a href="" class="header-notification" data-toggle="dropdown">
              <i class="icon ion-ios-bell-outline"></i>
              <span class="indicator"></span>
            </a>
            <div class="dropdown-menu">
              <div class="dropdown-menu-header">
                <h6 class="dropdown-menu-title">Notifications</h6>
                <div>
                  <a href="">Mark All as Read</a>
                  <a href="">Settings</a>
                </div>
              </div><!-- dropdown-menu-header -->
              <div class="dropdown-list">
                <!-- loop starts here -->
                <a href="" class="dropdown-link">
                  <div class="media">
                    <img src="http://via.placeholder.com/500x500" alt="">
                    <div class="media-body">
                      <p><strong>Suzzeth Bungaos</strong> tagged you and 18 others in a post.</p>
                      <span>October 03, 2017 8:45am</span>
                    </div>
                  </div><!-- media -->
                </a>
                <!-- loop ends here -->
                <a href="" class="dropdown-link">
                  <div class="media">
                    <img src="http://via.placeholder.com/500x500" alt="">
                    <div class="media-body">
                      <p><strong>Mellisa Brown</strong> appreciated your work <strong>The Social Network</strong></p>
                      <span>October 02, 2017 12:44am</span>
                    </div>
                  </div><!-- media -->
                </a>
                <a href="" class="dropdown-link read">
                  <div class="media">
                    <img src="http://via.placeholder.com/500x500" alt="">
                    <div class="media-body">
                      <p>20+ new items added are for sale in your <strong>Sale Group</strong></p>
                      <span>October 01, 2017 10:20pm</span>
                    </div>
                  </div><!-- media -->
                </a>
                <a href="" class="dropdown-link read">
                  <div class="media">
                    <img src="http://via.placeholder.com/500x500" alt="">
                    <div class="media-body">
                      <p><strong>Julius Erving</strong> wants to connect with you on your conversation with <strong>Ronnie Mara</strong></p>
                      <span>October 01, 2017 6:08pm</span>
                    </div>
                  </div><!-- media -->
                </a>
                <div class="dropdown-list-footer">
                  <a href="page-notifications.html"><i class="fa fa-angle-down"></i> Show All Notifications</a>
                </div>
              </div><!-- dropdown-list -->
            </div><!-- dropdown-menu-right -->
          </div><!-- dropdown -->
          <div class="dropdown dropdown-c">
            <a href="#" class="logged-user" data-toggle="dropdown">
              <img src="http://via.placeholder.com/500x500" alt="">
              <span>Katherine</span>
              <i class="fa fa-angle-down"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
              <nav class="nav">
                <a href="page-profile.html" class="nav-link"><i class="icon ion-person"></i> View Profile</a>
                <a href="page-edit-profile.html" class="nav-link"><i class="icon ion-compose"></i> Edit Profile</a>
                <a href="page-activity.html" class="nav-link"><i class="icon ion-ios-bolt"></i> Activity Log</a>
                <a href="page-settings.html" class="nav-link"><i class="icon ion-ios-gear"></i> Account Settings</a>
                <a href="page-signin.html" class="nav-link"><i class="icon ion-forward"></i> Sign Out</a>
              </nav>
            </div><!-- dropdown-menu -->
          </div><!-- dropdown -->
        </div><!-- header-right -->
      </div><!-- container -->
    </div><!-- slim-header -->

    <div class="slim-navbar">
      <div class="container">
        <ul class="nav">
          <li class="nav-item with-sub">
            <a class="nav-link" href="#">
              <i class="icon ion-ios-home-outline"></i>
              <span>Dashboard</span>
            </a>
            <div class="sub-item">
              <ul>
                <li><a href="index.html">Dashboard 01</a></li>
                <li><a href="index2.html">Dashboard 02</a></li>
                <li><a href="index3.html">Dashboard 03</a></li>
                <li><a href="index4.html">Dashboard 04</a></li>
                <li><a href="index5.html">Dashboard 05</a></li>
              </ul>
            </div><!-- sub-item -->
          </li>
          <li class="nav-item with-sub mega-dropdown">
            <a class="nav-link" href="#">
              <i class="icon ion-ios-filing-outline"></i>
              <span>UI Elements</span>
            </a>
            <div class="sub-item">
              <div class="row">
                <div class="col-lg-5">
                  <label class="section-label">Basic Elements</label>
                  <div class="row">
                    <div class="col">
                      <ul>
                        <li><a href="elem-accordion.html">Accordion</a></li>
                        <li><a href="elem-alerts.html">Alerts</a></li>
                        <li><a href="elem-buttons.html">Buttons</a></li>
                        <li><a href="elem-cards.html">Cards</a></li>
                        <li><a href="elem-carousel.html">Carousel</a></li>
                        <li><a href="elem-dropdowns.html">Dropdown</a></li>
                        <li><a href="elem-icons.html">Icons</a></li>
                        <li><a href="elem-images.html">Images</a></li>
                        <li><a href="elem-lists.html">Lists</a></li>
                      </ul>
                    </div><!-- col -->
                    <div class="col-lg">
                      <ul>
                        <li><a href="elem-modal.html">Modal</a></li>
                        <li><a href="elem-media.html">Media Object</a></li>
                        <li><a href="elem-navigation.html">Navigation</a></li>
                        <li><a href="elem-pagination.html">Pagination</a></li>
                        <li><a href="elem-tooltip.html">Tooltip</a></li>
                        <li><a href="elem-popover.html">Popover</a></li>
                        <li><a href="elem-progress.html">Progress</a></li>
                        <li><a href="elem-spinner.html">Spinner</a></li>
                        <li><a href="elem-typography.html">Typography</a></li>
                      </ul>
                    </div><!-- col -->
                  </div><!-- row -->
                </div><!-- col -->
                <div class="col-lg mg-t-30 mg-lg-t-0">
                  <label class="section-label">Charts</label>
                  <ul>
                    <li><a href="chart-morris.html">Morris Charts</a></li>
                    <li><a href="chart-flot.html">Flot Charts</a></li>
                    <li><a href="chart-chartjs.html">ChartJS</a></li>
                    <li><a href="chart-echarts.html">ECharts</a></li>
                    <li><a href="chart-chartist.html">Chartist</a></li>
                    <li><a href="chart-rickshaw.html">Rickshaw</a></li>
                    <li><a href="chart-sparkline.html">Sparkline</a></li>
                    <li><a href="chart-peity.html">Peity</a></li>
                  </ul>
                </div><!-- col -->
                <div class="col-lg mg-t-30 mg-lg-t-0">
                  <label class="section-label">Maps</label>
                  <ul>
                    <li><a href="map-google.html">Google Maps</a></li>
                    <li><a href="map-leaflet.html">Leaflet Maps</a></li>
                    <li><a href="map-vector.html">Vector Maps</a></li>
                  </ul>

                  <label class="section-label mg-t-20">Tables</label>
                  <ul>
                    <li><a href="table-basic.html">Basic Table</a></li>
                    <li><a href="table-datatable.html">Data Table</a></li>
                  </ul>
                </div><!-- col -->
                <div class="col-lg mg-t-30 mg-lg-t-0">
                  <label class="section-label">Helper / Utilities</label>
                  <ul>
                    <li><a href="util-background.html">Background</a></li>
                    <li><a href="util-border.html">Border</a></li>
                    <li><a href="util-height.html">Height</a></li>
                    <li><a href="util-margin.html">Margin</a></li>
                    <li><a href="util-padding.html">Padding</a></li>
                    <li><a href="util-position.html">Position</a></li>
                    <li><a href="util-typography.html">Typography</a></li>
                    <li><a href="util-width.html">Width</a></li>
                  </ul>
                </div><!-- col -->
              </div><!-- row -->
            </div><!-- dropdown-menu -->
          </li>
          <li class="nav-item with-sub active">
            <a class="nav-link" href="#">
              <i class="icon ion-ios-book-outline"></i>
              <span>Pages</span>
            </a>
            <div class="sub-item">
              <ul>
                <li><a href="page-profile.html">Profile Page</a></li>
                <li class="active"><a href="page-invoice.html">Invoice</a></li>
                <li><a href="page-contact.html">Contact Manager</a></li>
                <li><a href="page-file-manager.html">File Manager</a></li>
                <li><a href="page-calendar.html">Calendar</a></li>
                <li><a href="page-timeline.html">Timeline</a></li>
                <li class="sub-with-sub">
                  <a href="#">Pricing</a>
                  <ul>
                    <li><a href="page-pricing.html">Pricing 01</a></li>
                    <li><a href="page-pricing2.html">Pricing 02</a></li>
                    <li><a href="page-pricing3.html">Pricing 03</a></li>
                  </ul>
                </li>
                <li class="sub-with-sub">
                  <a href="page-signin.html">Sign In</a>
                  <ul>
                    <li><a href="page-signin.html">Signin Simple</a></li>
                    <li><a href="page-signin2.html">Signin Split</a></li>
                  </ul>
                </li>
                <li class="sub-with-sub">
                  <a href="page-signup.html">Sign Up</a>
                  <ul>
                    <li><a href="page-signup.html">Signup Simple</a></li>
                    <li><a href="page-signup2.html">Signup Split</a></li>
                  </ul>
                </li>
                <li class="sub-with-sub">
                  <a href="#">Error Pages</a>
                  <ul>
                    <li><a href="page-404.html">404 Not Found</a></li>
                    <li><a href="page-505.html">505 Forbidden</a></li>
                    <li><a href="page-500.html">500 Internal Server</a></li>
                    <li><a href="page-503.html">503 Service Unavailable</a></li>
                  </ul>
                </li>
              </ul>
            </div><!-- dropdown-menu -->
          </li>
          <li class="nav-item with-sub">
            <a class="nav-link" href="#" data-toggle="dropdown">
              <i class="icon ion-ios-gear-outline"></i>
              <span>Forms</span>
            </a>
            <div class="sub-item">
              <ul>
                <li><a href="form-elements.html">Form Elements</a></li>
                <li><a href="form-layouts.html">Form Layouts</a></li>
                <li><a href="form-validation.html">Form Validation</a></li>
                <li><a href="form-wizards.html">Form Wizards</a></li>
                <li><a href="form-editor.html">WYSIWYG Editor</a></li>
                <li><a href="form-select2.html">Select2</a></li>
                <li><a href="form-rangeslider.html">Range Slider</a></li>
                <li><a href="form-datepicker.html">Datepicker</a></li>
              </ul>
            </div><!-- dropdown-menu -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="page-messages.html">
              <i class="icon ion-ios-chatboxes-outline"></i>
              <span>Messages</span>
              <span class="square-8"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="widgets.html">
              <i class="icon ion-ios-analytics-outline"></i>
              <span>Widgets</span>
            </a>
          </li>
        </ul>
      </div><!-- container -->
    </div><!-- slim-navbar -->

    <div class="slim-mainpanel">
      <div class="container">
        <div class="slim-pageheader">
          <ol class="breadcrumb slim-breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active" aria-current="page">Invoice Page</li>
          </ol>
          <h6 class="slim-pagetitle">Invoice Page</h6>
        </div><!-- slim-pageheader -->

        <div class="card card-invoice">
          <div class="card-body">
            <div class="invoice-header">
              <h1 class="invoice-title">Invoice</h1>
              <div class="billed-from">
                <h6>Invoice Number</h6>
                <p>Travel Boutique Online(A Unit of Tek Travels
					Pvt Ltd)<br>Regd Office: E-78, South Extn Part-I, New Delhi
						110049<br>
                <br>Corp Off :Plot No 728, Udyog vihar
					Phase-V,Gurgaon 122016<br>
						Email: info@travelboutiqueonline.com<br>
						Web :www.travelboutiqueonline.com<br>
						Gurugram<br>
						Phone: 1244998999<br>
						CI Number : U74999DL2006PTC155233<br>
						PAN : AACCT6259K<br><br>
						GST State : Haryana<br>
						GSTIN : 06AACCT6259K1ZZ
                		</p>
              </div><!-- billed-from -->
         
			
				     <div id="pnrDtls">
              		<p>PNR:455m5<br>BTB TRAVEL TECH PVT LTD
                <br>206 A RAKH COMPLEX ASIYAN DIGHA<br>
						ROAD PATNA<br>
						Patna<br>
						Phone:7543041221<br>
						PAN:AAICB0695B<br>
						GST State:Bihar
                		</p>
              </div>
              
              <div id="date">
              		<p>Invoice Date :&nbsp<%=dt %>
                		</p>
              </div>
				</div><!-- invoice-header -->
            <div class="row mg-t-20">
              <div class="col-md">
                <label class="section-label-sm tx-gray-500"></label>
                <div class="billed-to">
                  <h7 class="tx-gray-800">Travel Date</h7>
                </div><br>
                <table>
                	
                	<tr>
                		<th>Sr.No</th>
                		<th>Ticket No</th>
                		<th>Sectors</th>
                		<th>Flight</th>
                		<th>PAX No</th>
                		<th>Type</th>
                		<th>Class</th>
                		<th>Fare</th>
                		<th>OT Tax</th>
                		<th>K3/GST</th>
                		<th>YQ Tax</th>
                		<th>Baggage ch.</th>
                		<th>Meal ch.</th>
                		<th>Seat ch.</th>
                		<th>Special Service Charges</th>
                		<th>S charges</th>
                		
                	</tr>
                	<tr>
                		<td>101</td>
                		<td>8574</td>
                		<td>del</td>
                		<td>indigo</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		<td>101885</td>
                		
                	</tr>
                </table>
              </div><!-- col -->
              
            </div><!-- row -->

            <hr class="mg-b-60">
		
			<div>
				<h6>Remarks:</h6>*** Voidation Rs 500All Penalties as per fare rules
			</div>
			<div>
				<p align="right">Gross:&nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 3698.00<br>
						
						Less &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp Commission Earned &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 41.47<br>
								Add &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp Tra Fee &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 0.00<br>
								Add &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp TDS Deducted &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 2.07<br>
								Add &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp CGST @0.00% &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 0.00<br>
								Add &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp SGST @0.00% &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 0.00<br>
								Add &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp IGST@18.00% &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 0.00<br>
								Less &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp Amount Paid By Agent
								Credit Card &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 0.00<br>
								Net Amount &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp 3659.00
			</div>
    			<div>
    				<h6 id="gstDtls">GST Details:</h6>
    				
    				<table id="gstTable">
    					<tr>
    						<th>Service&nbspDescription</th>
    						<th>SAC&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
    						<th>Taxable&nbspValue&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
    						<th>CGST&nbsp@&nbsp0.00%&nbsp&nbsp&nbsp&nbsp</th>
    						<th>SGST&nbsp@&nbsp0.00%&nbsp&nbsp&nbsp&nbsp</th>
    						<th>IGST&nbsp@&nbsp18.00%&nbsp&nbsp&nbsp&nbsp</th>
    						<th>Total&nbspGST&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
    					</tr>
    					
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    					</tr>
    				</table>
    				
    			</div><br>
    			<div>
    				<h6 id="gstDtls">Passenger GST Details</h6>
    				
    					<table id="gstTable">
    					<tr>
    						<th>Lead&nbspPax&nbspName</th>
    						<th>GST&nbspNumber&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
    						<th>GST&nbspCompany&nbspContact&nbsp</th>
    						<th>GST&nbspCompany&nbspAddress&nbsp&nbsp&nbsp</th>
    						<th>GST&nbspCompany&nbspEmail&nbsp&nbsp</th>
    						<th>GST&nbspCompany&nbspName&nbsp&nbsp&nbsp</th>
    					
    					</tr>
    					
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						
    					</tr>
    				</table>
    				
    			</div>
    			
    			<div>
    				<h6 id="status">Invoice Status :Paid<br>
    								Billed by : Travel Boutique Online<br>
    								Ticketed by : RAHUL KUMAR	
    				</h6>
    			</div>
    			
    			<div>
    				<ul>Terms & Conditions :
    					<li>This is computer generated invoice signature not required.</li>
    					<li>All Cases Disputes are subject to New Delhi Jurisdiction.</li>
    					<li>Refunds Cancellations are subject to Airline's approval.</li>
    					<li>Kindly check all details carefully to avoid unnecessary complications.</li>
    					<li>CHEQUE : Must be drawn in favour of 'TRAVEL BOUTIQUE ONLINE'.</li>
    					<li>LATE PAYMENT : Interest @ 24% per annum will be charged on all outstanding bills after due date.</li>
    					
    				</ul>
    			</div>
          </div><!-- card-body -->
        </div><!-- card -->

      </div><!-- container -->
    </div><!-- slim-mainpanel -->

    <div class="slim-footer">
      <div class="container">
        <p>Copyright 2018 &copy; All Rights Reserved. Slim Dashboard Template</p>
        <p>Designed by: <a href="">ThemePixels</a></p>
      </div><!-- container -->
    </div><!-- slim-footer -->

    <script src="../lib/jquery/js/jquery.js"></script>
    <script src="../lib/popper.js/js/popper.js"></script>
    <script src="../lib/bootstrap/js/bootstrap.js"></script>
    <script src="../lib/jquery.cookie/js/jquery.cookie.js"></script>

    <script src="../js/slim.js"></script>
    
    <button>DownLoad</button>
    
    <% 
    PdfWriter.getInstance(document, new FileOutputStream("F:/testpdf2.pdf"));
    document.open();
    HTMLWorker htmlWorker = new HTMLWorker(document);
    htmlWorker.parse(new StringReader(str));
    response.setContentType("application/pdf");
    response.setHeader("Content-disposition","inline; filename=test.pdf");
        out.println(request.getContextPath());
    document.close();
   // response.sendRedirect("pdf.jsp");
    System.out.println("Done");
    
    }
  		catch(Exception e){
  			e.printStackTrace();
  		}
  		%>
    </form>
  </body>
</html>
