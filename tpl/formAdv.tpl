<form method="post">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Описание</label>
                <input name="description" value="[+form.description+]" class="form-control">
            </div>
            <div class="form-group">
                <label>Ссылка</label>
                <input name="link" value="[+form.link+]" class="form-control">
            </div>
            <div class="form-group">
                <label>Зона</label>
                <input name="area" value="[+form.area+]" class="form-control">
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="checkbox" name="published" value="1" [[if? &is=`[+form.published+]:is:1` &then=`checked`]] >
                        <label>Активен</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="checkbox" name="counted" value="1" [[if? &is=`[+form.counted+]:is:1` &then=`checked`]] >
                        <label>Вести подсчет прсмотров</label>
                        <br><i>Просмотров: [+form.count_view+]</i>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="checkbox" name="jump_counted" value="1" [[if? &is=`[+form.jump_counted+]:is:1` &then=`checked`]] >
                        <label>Вести подсчет переходов</label>
                        <br><i>Переходов: [+form.jump_count+]</i>
                    </div>
                </div>
            </div>


        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Дата начала</label>
                <input name="pub_date" value="[+form.start_date+]" class="DatePicker form-control">
            </div>
            <div class="form-group">
                <label>Дата окончания</label>
                <input name="unpub_date" value="[[if? &is=`[+form.unpub_date+]:isnot: ` &then=`[+form.end_date+]`]]" class="DatePicker form-control">
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label>Баннер</label>
                        <input name="content" value="[+form.content+]" class="form-control" id="content" onchange="documentDirty=true;">
                    </div>
                    <div class="col-md-4">
                        <label>&nbsp;</label>
                        <input type="button" class="btn btn-success form-control" value="Вставить" onclick="BrowseServer('content')">
                    </div>
                    <div class="col-md-2">
                        <img width="50" height="auto" src="/[+form.content+]" id="img_target">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>План показов (0 - безлимит)</label>
                            <input class="form-control" name="total_view" value="[+form.total_view+]">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>План переходов (0 - безлимит)</label>
                            <input class="form-control" name="total_jump" value="[+form.total_jump+]">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <button class="btn btn-success" name="save" value="1"><i class="fa fa-save"></i> Сохранить</button>
        </div>
    </div>
</form>