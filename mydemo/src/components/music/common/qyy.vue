<template>
    <div>
        <!-- 头部 -->
        <div class="divqyy1">
            <table></table>
            <div class="divqyy2">歌曲详细</div>
            <div class="qyydiv1">轻音乐</div>
            <p class="divqyy3">让你心情愉快的轻音乐</p>
            <p class="divqyy4">时间：2018-08-31</p>
        </div>
        <div>
            <div class="divp2">花-岸部眞明</div>
            <div class="divqyy5" @click="bf">
                <img src="../../../img/qyy1.png" alt="" class="divimg1">
                <img src="http://127.0.0.1:4000/img/暂停.png" alt="" id="img1">
                <div class="divqyy6">岸部眞明 - 花.mp3</div>
                <div class="divqyy7">岸部眞明</div>
                <audio src="http://127.0.0.1:4000/mp3/01.mp3" id="c4"></audio>
            </div>
        </div>
        <div>
            <div class="divp2">流行的云 - 岸部真明</div>
            <div class="divqyy5" @click="bf1">
                <img src="../../../img/qyy2.png" alt="" class="divimg1">
                <img src="http://127.0.0.1:4000/img/暂停.png" alt="" id="img2">
                <div class="divqyy6">岸部眞明 - 流れ行く云.mp3</div>
                <div class="divqyy7">岸部眞明</div>
                <audio src="http://127.0.0.1:4000/mp3/02.mp3" id="c5"></audio>
            </div>
        </div>
        <div>
            <div class="divp2">LOVIN' YOU - 押尾コータロー</div>
            <div class="divqyy5" @click="bf2">
                <img src="../../../img/qyy3.png" alt="" class="divimg1">
                <img src="http://127.0.0.1:4000/img/暂停.png" alt="" id="img3">
                <div class="divqyy6">押尾コータロー - LOVIN' YOU.mp3</div>
                <div class="divqyy7">押尾コータロー</div>
                <audio src="http://127.0.0.1:4000/mp3/03.mp3" id="c6"></audio>
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
        var c4 = document.getElementById("c4");
        var img = document.getElementById("img1");
        // console.log(img);
        if(c4.paused){
            c4.play();
             img.src = "http://127.0.0.1:4000/img/播放.png";
        }else{
            c4.pause();
             img.src = "http://127.0.0.1:4000/img/暂停.png";
        }
    },
    bf1(){
        var c5 = document.getElementById("c5");
        var img = document.getElementById("img2");
        // console.log(img);
        if(c5.paused){
            c5.play();
             img.src = "http://127.0.0.1:4000/img/播放.png";
        }else{
            c5.pause();
             img.src = "http://127.0.0.1:4000/img/暂停.png";
        }
    },
     bf2(){
        var c6 = document.getElementById("c6");
        var img = document.getElementById("img3");
        // console.log(img);
        if(c6.paused){
            c6.play();
             img.src = "http://127.0.0.1:4000/img/播放.png";
        }else{
            c6.pause();
             img.src = "http://127.0.0.1:4000/img/暂停.png";
        }
    }
}
}
}
</script>
<style>
/*头部div样式*/ 
.divqyy1{
    width: 100%;height: 166px;
}
/*头部div文字样式*/
.divqyy2{
   margin:20px 0px 20px 20px;
    font-size:18px;
    font-weight:bold;
} 
.divqyy3{
    display:flex;
    transform: translate(130px,-80px);
    font-size:16px;
    font-weight: bold;
    color:#000;
}
.divqyy4{
    display:flex;
    transform: translate(130px,-70px);
    font-size:14px;
    color:#666;
}
.qyydiv1{
    margin-left:20px;
    width: 87px;height:87px;
    color:#fff;
    background-image: url("../../../img/beijing.png");
    background-repeat:no-repeat;
    background-size:100%;
    text-align: center;
    line-height: 490%;
}
/*1楼div*/
.divqyy5{
    border:1px solid #ccc;
    background:f5f5f9;
    margin-left:20px; 
    width:100%;height:64px;
    display: flex;
} 
.divimg1{
    width:70px;height:63px;
}
.divqyy6{
    transform: translate(17px,8px);
    width:210px;height: 25px; 
    font-size:16px;
    white-space: nowrap;
    overflow: hidden;/*溢出隐藏*/
    text-overflow: ellipsis;
    word-break: break-all;
}
.divqyy7{
    transform: translate(-126px,30px);
    font-size:12px;
    color: #ccc;
    width:210px;height: 17px; 
    white-space: nowrap;
    overflow: hidden;/*溢出隐藏*/
    text-overflow: ellipsis;
    word-break: break-all;
}
.divp2{
    margin-bottom:5px; 
    margin-left:20px; 
    margin-top: 15px;
}
#img1{
    width:20px;height:20px;
    transform: translate(-45px,22px);
}
#img2{
    width:20px;height:20px;
    transform: translate(-45px,22px);
}
#img3{
    width:20px;height:20px;
    transform: translate(-45px,22px);
}
</style>
