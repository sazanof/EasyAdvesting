<form method="post">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Описание</label>
                <input name="description" value="" class="form-control">
            </div>
            <div class="form-group">
                <label>Ссылка</label>
                <input name="link" value="" class="form-control">
            </div>
            <div class="form-group">
                <label>Зона</label>
                <input name="area" value="" class="form-control">
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="checkbox" name="published" value="1" >
                        <label>Активен</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="checkbox" name="counted" value="1" >
                        <label>Вести подсчет прсмотров</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="checkbox" name="jump_counted" value="1" >
                        <label>Вести подсчет переходов</label>
                    </div>
                </div>
            </div>


        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Дата начала</label>
                <input name="pub_date" value="" class="DatePicker form-control">
            </div>
            <div class="form-group">
                <label>Дата окончания</label>
                <input name="unpub_date" value="" class="DatePicker form-control">
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label>Баннер</label>
                        <input name="content" value="" class="form-control" id="content" onchange="documentDirty=true;">
                    </div>
                    <div class="col-md-4">
                        <label>&nbsp;</label>
                        <input type="button" class="btn btn-success form-control" value="Вставить" onclick="BrowseServer('content')">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>План показов (0 - безлимит)</label>
                            <input class="form-control" name="total_view" value="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>План переходов (0 - безлимит)</label>
                            <input class="form-control" name="total_jump" value="">
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