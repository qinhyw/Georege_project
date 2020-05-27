<template>
    <div>
        <h3 class="toph3">歌曲详情</h3>
        <div class="divtop2">
            <div>
                <img src="../../../img/yybd1.jpg" alt="" class="topimg1">
            </div>
            <div class="divtop3">
                <h3>光年之外</h3>
                <p>歌手：邓紫棋</p>
                <p>时间：2016-12-30</p>
            </div>
        </div>
        <div>
            <p>专辑介绍：《光年以外》是年度科幻巨制电影</p>
            <p>《太空旅客》的中文主题曲，G.E.M.邓紫棋为其填词作曲，倾情唱出这场由奥斯卡影后詹妮弗·劳伦斯和“星爵”克里斯·帕拉特主演的太空爱恋。</p>
            <p>“缘分让我们相遇乱世以外，命运却要我们危难中相爱。也许未来遥远在光年之外，我愿守候未知里为你等待。”</p>
        </div>
        <div class="topdiv1" @click="bf">
            <div>
                <img src="../../../img/yybd1.jpg" alt="" class="top1">
                    <span id="ctl">
                        <img src="../../../img/播放.png" alt="" class="ctlimg">
                    </span>
            </div>
            <div class="conter">
                <div class="name">G.E.M. 邓紫棋 - 光年之外(1).mp3</div>
                <div class="author">邓紫棋</div>
                <div class="time">00:06</div>
                <audio src="http://127.0.0.1:4000/mp3/1.mp3" class="top1mp3" id="c3"></audio>
            </div>
        </div>  
    </div>
</template>
<script>
export default {
    data(){
        return{
        bf(){
        //  console.log(456);
        var c3 = document.getElementById("c3");
        var ctl = document.getElementById("ctl");
        var img = document.querySelector("#ctl img");
        // console.log(img);
        if(c3.paused){
            c3.play();
             img.src = "http://127.0.0.1:4000/img/播放.png";
        }else{
            c3.pause();
             img.src = "http://127.0.0.1:4000/img/暂停.png";
        }
        // var c3 = document.getElementById("c3"); 
        // var ctl = document.getElementById("ctl");
        // var img = document.querySelector("#ctl img");
        // ctl.onclick = function (event){
        //      event.preventDefault();
        //      if(c3.paused){
        //         c3.play();//播放
        //         // 当视频播放修改成竖线图片
        //         img.src = "../../../img/暂停.png";
        //     }else{
        //         c3.pause();//暂停
        //         // 当视频暂停修改成三角形图片
        //         img.src = "../../../img/播放.png"
        //     }
        // }
        }
        };
    },
    mounted(){
        // var c3 = document.getElementById("c3"); 
        // var ctl = document.getElementById("ctl");
        // var img = document.querySelector("#ctl img");
        // ctl.onclick = function (event){
        //      event.preventDefault();
        //      if(c3.paused){
        //         c3.play();//播放
        //         // 当视频播放修改成竖线图片
        //         img.src = "../../../img/暂停.png";
        //     }else{
        //         c3.pause();//暂停
        //         // 当视频暂停修改成三角形图片
        //         img.src = "../../../img/播放.png"
        //     }
        // }
    },
    methods: {
    
    },
}

</script>
<style>
h3{
    margin-left:10px;
}
p{
    font-size:16px;
    color:#666;
    margin-left:10px;
    margin-top:15px;  
    margin-bottom:12px; 
}
.ctl{
    display: block;
    transform:translate(15px,-50px);
}
.ctlimg{
    transform:translate(-54px,-18px);
}
/*mp3样式*/
.top1mp3{
    transform: translateY(-50px);
} 
/*一楼div*/
.divtop3{
    margin-left:15px;
} 
/*顶部图片*/
.topimg1{
    width: 82px;height:82px;;
}
/*顶部字体*/
.toph3{
    margin-top: 10px;
    margin-left: 20px;
} 
/*顶部div*/
.divtop2{
    display:flex;
    padding-top:10px;
    padding-left:15px; 
} 
/*播放图片*/ 
.top1{
    width:63px;height:65px;/*图片宽高*/
}
/*底部播放div*/
.topdiv1{
    margin-left:20px;/*左外边距*/
    display: flex;/*弹性布局*/
    width:100%;height: 65px;/*div宽高*/
    border:1px solid #666;/*边框*/
    background: #f5f5f5;/*背景颜色*/
} 
/*歌曲名字*/ 
.name{
    padding-top:10px;
    font-size:14px;
    margin-left:20px;
}
/*歌手姓名*/
.author{
    font-size:12px;
    margin-top:5px;
    margin-left:20px;
}
/*播放时间*/
.time{
    transform: translate(255px,-40px);
    font-size:10px;
} 
</style>

