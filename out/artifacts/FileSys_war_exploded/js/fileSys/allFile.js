$(function(){
    $.post("AllFileAction",null,function(data){

        $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "正在读取数据，请稍后...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "行政文号", "sClass": "center"  },
                { "mData": "体系文号", "sClass": "center"  },
                { "mData": "来文单位", "sClass": "center" },
                { "mData": "来文数量", "sClass": "center"  },
                { "mData": "红头数量", "sClass": "center"  },
                { "mData": "文件名称", "sClass": "center"  },
                { "mData": "附件名称", "sClass": "center"  },
                { "mData": "文件类型", "sClass": "center"  },
                { "mData": "收文编号", "sClass": "center"  },
                { "mData": "范围（复印）", "sClass": "center"  },
                { "mData": "范围（红头）", "sClass": "center"  },
                { "mData": "来文类型", "sClass": "center"  },
                { "mData": "时间", "sClass": "center"  },
                { "mData": "发布单位", "sClass": "center" },
                { "mData": "状态", "sClass": "center"  }
            ],
            "bDestroy" : true,
            "sPaginationType": "bootstrap",
            "bAutoWith": true,
            "bSort": true,
            "bLengthChange": false,
            "bStateSave": false,
            "oLanguage": {
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                "sSearch": "搜索",
                "sZeroRecords": "对不起，查询不到相关数据！",
                "sEmptyTable": "表中无数据存在！",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            }
        } );
    })
});
