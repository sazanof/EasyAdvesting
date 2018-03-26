<html>
<head>
    <title>[+adv.pagetitle+]</title>
    <link rel="stylesheet" href="media/style/common/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="media/style/default/style.css" />
    <link rel="stylesheet" type="text/css" href="/assets/modules/easyadvertising/css/style.css" />
    <script type="text/javascript" src="media/script/tabpane.js"></script>
    <script type="text/javascript" src="/assets/modules/easyadvertising/js/module.js"></script>
</head>
    <body>
    <div class="sectionBody">
        <h1>Adversting - управление рекламой</h1>
        <div id="actions">
            <ul class="actionButtons">
                <li><a href="[+adv.mod_url+]"><i class="fa fa-home" aria-hidden="true"></i> К списку</a></li>
                <li><a href="[+adv.mod_url+]&add=true"><i class="fa fa-plus" aria-hidden="true"></i> Добавить запись</a></li>
                <li><a href="github.com/sazanof" target="_blank"><i class="fa fa-github" aria-hidden="true"></i> Git</a></li>
            </ul>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="tab-pane" id="advPane">
                        <script type="text/javascript">
                            tpResources = new WebFXTabPane(document.getElementById('advPane'));
                        </script>
                        <div class="tab-page" id="mainTabs">
                            <h2 class="tab"><i class="fa fa-home"></i> [+adv.pagetitle+]</h2>
                            <div class="tab-body">
                                [+adv.message+]
                                [+adv.content+]
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="media/calendar/datepicker.js"></script>
    <script>
        var dpOffset = -10;
        var dpformat = 'dd-mm-YYYY hh:mm:00';
        var dpdayNames = ['Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'];
        var dpmonthNames = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
        var dpstartDay = 1;
        var DatePickers = document.querySelectorAll('input.DatePicker');
        if(DatePickers) {
            for(var i = 0; i < DatePickers.length; i++) {
                let format = DatePickers[i].getAttribute("data-format");
                new DatePicker(DatePickers[i], {
                    yearOffset: dpOffset,
                    format: format !== null ? format : dpformat,
                    dayNames: dpdayNames,
                    monthNames: dpmonthNames,
                    startDay: dpstartDay
                });
            }
        }

        var lastImageCtrl;
        var lastFileCtrl;
        function OpenServerBrowser(url, width, height ) {
            var iLeft = (screen.width  - width) / 2 ;
            var iTop  = (screen.height - height) / 2 ;

            var sOptions = 'toolbar=no,status=no,resizable=yes,dependent=yes' ;
            sOptions += ',width=' + width ;
            sOptions += ',height=' + height ;
            sOptions += ',left=' + iLeft ;
            sOptions += ',top=' + iTop ;

            var oWindow = window.open( url, 'FCKBrowseWindow', sOptions ) ;
        }
        function BrowseServer(ctrl) {
            lastImageCtrl = ctrl;
            var w = screen.width * 0.5;
            var h = screen.height * 0.5;
            OpenServerBrowser('[+adv.url+]media/browser/mcpuk/browser.php?Type=images', w, h);
        }
        function BrowseFileServer(ctrl) {
            lastFileCtrl = ctrl;
            var w = screen.width * 0.5;
            var h = screen.height * 0.5;
            OpenServerBrowser('[+adv.url+]media/browser/mcpuk/browser.php?Type=files', w, h);
        }
        function SetUrlChange(el) {
            if ('createEvent' in document) {
                var evt = document.createEvent('HTMLEvents');
                evt.initEvent('change', false, true);
                el.dispatchEvent(evt);
            } else {
                el.fireEvent('onchange');
            }
        }
        function SetUrl(url, width, height, alt) {
            if(lastFileCtrl) {
                var c = document.getElementById(lastFileCtrl);
                if(c && c.value != url) {
                    c.value = url;
                    SetUrlChange(c);
                }
                lastFileCtrl = '';
            } else if(lastImageCtrl) {
                var c = document.getElementById(lastImageCtrl);
                if(c && c.value != url) {
                    c.value = url;
                    SetUrlChange(c);
                }
                lastImageCtrl = '';
            } else {
                return;
            }
        }
    </script>

    </body>
</html>