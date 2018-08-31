<html>
<head>
    <title>订单</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .print-data{
            width: 800px;
        }
    </style>
</head>
<body>
<div class="print-data">
    <h4 style="text-align: center"> 万 源 鑫 海 粮 食 油 商 贸 销 售 单 </h4>
    <small>打印日期:${.now?string["yyyy-MM-dd hh:mm"]}</small>&nbsp;&nbsp;&nbsp;
    <small>订单编号:${order.orderId}</small>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">项目</th>
            <th scope="col">商品名称</th>
            <th scope="col">数量</th>
            <th scope="col">单价</th>
            <th scope="col">运费单价</th>
            <th scope="col">单项总价</th>
        </tr>
        </thead>
        <tbody>
        <#assign x=0 />
        <#assign orderPrice=0 />

        <#list order.orderInfoVOS as orderInfo>
            <#assign x=x+1/>
            <tr>
                <th scope="row">${x}</th>
                <td>${orderInfo.goods.title}</td>
                <td>${orderInfo.number}</td>
                <td><#if orderInfo.goods.saleStatus == 1>
                    ${orderInfo.goods.salePrice }
                </#if>
                <#if orderInfo.goods.saleStatus == 0>
                    ${orderInfo.goods.originalPrice }
                </#if></td>
                <td>${orderInfo.goods.despatchMoney}</td>
                <#assign orderPrice = orderPrice+ (orderInfo.transactionPrice*orderInfo.number + orderInfo.goods.despatchMoney*orderInfo.number) />
                <td>${orderInfo.transactionPrice*orderInfo.number + orderInfo.goods.despatchMoney*orderInfo.number}</td>
            </tr>
        </#list>
        </tbody>
    </table>
    <p><small>所售商品如有质量问题或与送货单数量不符的，请于三天内与我公司联系。</small></p>
    <p><small>所售商品在15日之内无质量问题的基于调换，超过15日不给予调换</small></p>
    <p>送货人:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经手人:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;付款方式:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>


</div>


</body>
</html>