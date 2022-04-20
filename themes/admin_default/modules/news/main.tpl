<!-- BEGIN: main -->
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_DATA}.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>

<div class="well">
    <form action="{NV_BASE_ADMINURL}index.php" method="get" onsubmit="return check_validate()">
        <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}" />
        <input type="hidden" name="catid" value="{CATID}" />

        <div class="row">
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label class="font__weight">{LANG.search_key}</label>
                    <input class="form-control" type="text" value="{Q}" maxlength="64" name="q"/>
                </div>
            </div>
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label class="font__weight">{SEARCH_TYPE.value}</label>
                    <select class="form-control" name="stype">
                        <!-- BEGIN: search_type -->
                        <option value="{SEARCH_TYPE.key}" {SEARCH_TYPE.selected} >{SEARCH_TYPE.value}</option>
                        <!-- END: search_type -->
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label class="font__weight">{LANG.content_cat}</label>
                    <select class="form-control" name="catid" id="catid">
                        <!-- BEGIN: cat_content -->
                        <option value="{CAT_CONTENT.value}" {CAT_CONTENT.selected} >{CAT_CONTENT.title}</option>
                        <!-- END: cat_content -->
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label class="font__weight">{LANG.search_status}</label>
                    <select class="form-control" name="sstatus">
                        <option value="-1"> -- {LANG.search_status} -- </option>
                        <!-- BEGIN: search_status -->
                        <option value="{SEARCH_STATUS.key}" {SEARCH_STATUS.selected} >{SEARCH_STATUS.value}</option>
                        <!-- END: search_status -->
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label class="font__weight">{LANG.search_per_page}</label>
                    <select class="form-control" name="per_page">
                        <option value="">{LANG.search_per_page}</option>
                        <!-- BEGIN: s_per_page -->
                        <option value="{SEARCH_PER_PAGE.page}" {SEARCH_PER_PAGE.selected}>{SEARCH_PER_PAGE.page}</option>
                        <!-- END: s_per_page -->
                    </select>
                </div>
            </div>

            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label for="publtime" class="font__weight">{LANG.search_time_to}</label>
                    <div class="group__input_date">
                        <input type="text" name="search_time_from" class="form-control" value="{TIME_FROM}" id="search_time_from" maxlength="10">
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <label for="creator" class="font__weight">{LANG.search_time_from}</label>
                    <div class="group__input_date">
                        <input type="text" name="search_time_to" class="form-control" value="{TIME_TO}" id="search_time_to" maxlength="10">
                    </div>
                </div>
            </div>
           
            <div class="col-xs-12 col-md-3">
                <div class="form-group">
                    <input class="btn btn-primary mt_25" type="submit" value="{LANG.search}" />
                </div>
            </div>
        </div>
        <input type="hidden" name="checkss" value="{NV_CHECK_SESSION}" />
        <label><em>{LANG.search_note}</em></label>
    </form>
</div>

<form class="navbar-form" name="block_list" action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center"><input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);" /></th>
                    <th class="text-center"><a href="{base_url_name}">{LANG.name}</a></th>
                    <th class="text-center"><a href="{base_url_publtime}">{LANG.content_publ_date}</a></th>
                    <th>{LANG.author}</th>
                    <th>{LANG.status}</th>
                    <th class="text-center"><a href="{base_url_hitstotal}"><em title="{LANG.hitstotal}" class="fa fa-eye">&nbsp;</em></a></th>
                    <th class="text-center"><a href="{base_url_hitscm}"><em title="{LANG.numcomments}" class="fa fa-comment-o">&nbsp;</em></a></th>
                    <th class="text-center"><em title="{LANG.numtags}" class="fa fa-tags">&nbsp;</em></th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN: loop -->
                <tr class="{ROW.class}">
                    <td class="text-center">
                        <!-- BEGIN: checkrow -->
                        <input type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{ROW.id}" name="idcheck[]" />
                        <!-- END: checkrow -->
                    </td>
                    <td class="text-left">
                        <!-- BEGIN: sort -->
                        <a href="javascript:void(0);" title="{LANG.order_articles_number}: {ROW.weight}" onclick="nv_sort_content({ROW.id}, {ROW.weight})"><i class="fa fa-fw fa-sort" aria-hidden="true"></i></a>
                        <!-- END: sort -->
                        <!-- BEGIN: is_editing -->
                        <i class="fa fa-fw fa-{LEV_EDITING} text-warning" data-toggle="tooltip" title="{USER_EDITING} {LANG.post_is_editing}."></i>
                        <!-- END: is_editing -->
                        <!-- BEGIN: text -->
                        <strong><em>{LANG.status_4}</em></strong>:
                        <!-- END: text -->
                        <a target="_blank" href="{ROW.link}" id="id_{ROW.id}" title="{ROW.title}">{ROW.title_clean}</a>
                    </td>
                    <td>{ROW.publtime}</td>
                    <td>{ROW.author}</td>
                    <td title="{ROW.status}">{ROW.status}</td>
                    <td class="text-center">{ROW.hitstotal}</td>
                    <td class="text-center">{ROW.hitscm}</td>
                    <td class="text-center">{ROW.numtags}</td>
                    <td class="text-center">
                        <!-- BEGIN: copy_news --><a href="{URL_COPY}" class="btn btn-success btn-xs" title="{LANG.title_copy_news}" ><i class="fa fa-copy"></i></a><!-- END: copy_news -->
                        <!-- BEGIN: excdata --><a href="{ROW.url_send}" class="btn btn-success btn-xs"><i class="fa fa-paper-plane-o"></i>{LANG.send}</a><!-- END: excdata -->
                        {ROW.feature}
                    </td>
                </tr>
                <!-- END: loop -->
            </tbody>
            <tfoot>
                <tr class="text-left">
                    <td colspan="12">
                        <select class="form-control w150" name="action" id="action">
                            <!-- BEGIN: action -->
                            <option value="{ACTION.value}">{ACTION.title}</option>
                            <!-- END: action -->
                        </select>
                        <input type="button" class="btn btn-primary" onclick="nv_main_action(this.form, '{NV_CHECK_SESSION}', '{LANG.msgnocheck}')" value="{LANG.action}" />
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</form>

<div id="order_articles" title="{LANG.order_articles}">
    <strong id="order_articles_title">{LANG.order_articles}</strong>
    <form method="post" class="form-horizontal">
        <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}" />
        <input type="hidden" name="order_articles_id" value="0" id="order_articles_id"/>
        <div class="form-group">
            <label for="order_articles_number" class="col-sm-12 control-label">{LANG.order_articles_number}</label>
            <div class="col-sm-12">
               <input type="number" class="form-control text-center w100" id="order_articles_number"  value="" readonly="readonly">
            </div>
        </div>
        <div class="form-group">
            <label for="order_articles_new" class="col-sm-12 control-label">{LANG.order_articles_new}</label>
            <div class="col-sm-12">
               <input type="number" class="form-control text-center w100" name="order_articles_new" id="order_articles_new"  value="" min="1">
            </div>
        </div>
        <div class="form-group text-center">
           <button type="submit" class="btn btn-primary">{LANG.action}</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<!-- BEGIN: generate_page -->
<div class="text-center">
    {GENERATE_PAGE}
</div>
<!-- END: generate_page -->
<script type="text/javascript">
function check_validate() {
    if ($("#search_time_to").val().trim() != "" && $("#search_time_from").val().trim() == "") {
        $("#search_time_from").focus();
        return false;
    } 

    if ($("#search_time_to").val().trim() == "" && $("#search_time_from").val().trim() != "") {
        $("#search_time_to").focus();
        return false;
    }

    if ($("#search_time_to").val().trim() != "" && $("#search_time_from").val().trim() != "") {
        arr_date_from = $("#search_time_from").val().trim().split("/");
        arr_date_to = $("#search_time_to").val().trim().split("/");
        var d_from = new Date(arr_date_from[2], arr_date_from[1], arr_date_from[0]);
        var d_to = new Date(arr_date_to[2], arr_date_to[1], arr_date_to[0]);
        var check_date = d_to < d_from ? false : true;
        if (!check_date) {
            $("#search_time_to").focus();
            return false
        }
    }
    return true;
}

$(function() {

    $( "#order_articles" ).dialog({
        autoOpen: false,
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "explode",
            duration: 500
        }
    });

    $("#catid").select2({
        language : '{NV_LANG_DATA}'
    });

    $("#search_time_from, #search_time_to").datepicker({
        showOn: "both",
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        showOtherMonths: true,
        buttonImage: nv_base_siteurl + "assets/images/calendar.gif",
        buttonImageOnly: true,
    });
});
</script>
<!-- END: main -->
