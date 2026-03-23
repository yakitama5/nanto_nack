((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var C,B,A={
aXn(d,e,f){var y,x,w=null,v=new C.uv(B.oQ,d),u=new C.uv(B.hR,d)
u=new A.Zt(v,u)
u.QC(d,w,e,w)
y=u.a
x=v.r
x.toString
y.r=x
v.r=A.bdX(u)
return u},
bdW(d,e){var y
A:{y="Retry"
if("app.title"===e){y="NantoNack"
break A}if("app.subtitle"===e){y="UI/UX Intuition Quiz"
break A}if("home.stageList"===e){y="Stage List"
break A}if("home.playCount"===e){y="Played {count} times"
break A}if("stage.cleared"===e){y="Cleared"
break A}if("stage.available"===e){y="Available"
break A}if("stage.locked"===e){y="Complete previous stage"
break A}if("stage.play"===e){y="Play"
break A}if("stage.clearTime"===e){y="Clear Time: {time}"
break A}if("stage.score"===e){y="Score: {score}pts"
break A}if("quiz.correct"===e){y="Correct!"
break A}if("quiz.incorrect"===e){y="Incorrect"
break A}if("quiz.timeUp"===e){y="Time's Up"
break A}if("quiz.result"===e){y="Result"
break A}if("quiz.retry"===e)break A
if("quiz.next"===e){y="Next"
break A}if("quiz.back"===e){y="Back"
break A}if("purchase.limitReached"===e){y="Daily play limit reached"
break A}if("purchase.unlockDescription"===e){y="Upgrade to Premium to play\nwithout limits"
break A}if("purchase.upgrade"===e){y="Upgrade"
break A}if("purchase.later"===e){y="Later"
break A}if("error.unknown"===e){y="An error occurred"
break A}if("error.retry"===e)break A
if("dashboard.title"===e){y="Dashboard"
break A}if("dashboard.todayTip"===e){y="Today's UI/UX Tip"
break A}if("dashboard.remainingPlays"===e){y="Remaining Plays"
break A}if("dashboard.remainingPlaysCount"===e){y="{count} remaining"
break A}if("dashboard.unlimitedPlays"===e){y="Unlimited"
break A}if("dashboard.streak"===e){y="Streak"
break A}if("dashboard.streakDays"===e){y=new A.aL5(d)
break A}if("dashboard.activityHistory"===e){y="Play History"
break A}if("dashboard.noActivity"===e){y="No play history yet"
break A}if("play.startPlay"===e){y="Play Now"
break A}if("play.selectCategory"===e){y="Select Category"
break A}if("play.selectCategoryDescription"===e){y="Choose a category to challenge"
break A}if("play.selectStage"===e){y="Select Stage"
break A}if("play.stageCount"===e){y="{count} stages"
break A}y=null
break A}return y},
bdX(d){return new A.aL6(d)},
Zt:function Zt(d,e){var _=this
_.z=d
_.cy=_.cx=_.CW=_.Q=$
_.a=e
_.y=_.x=_.w=_.b=$},
aJO:function aJO(){},
aJN:function aJN(d){this.b=d},
aJP:function aJP(){},
aL6:function aL6(d){this.a=d},
aL5:function aL5(d){this.a=d},
a9R:function a9R(){},
jJ(d,e){return new A.a7q(d)},
b8n(d){var y=$.b2u().i(0,d)
if(y==null){C.aRz("Resolver for <lang = "+d+"> not specified! Please configure it via LocaleSettings.setPluralResolver. A fallback is used now.")
return $.b1S()}return y},
aL0:function aL0(){},
aL1:function aL1(){},
aLL:function aLL(){},
aLM:function aLM(){},
aLN:function aLN(){},
aLY:function aLY(){},
aM1:function aM1(){},
aM2:function aM2(){},
aM3:function aM3(){},
aM4:function aM4(){},
aM5:function aM5(){},
aM6:function aM6(){},
aM7:function aM7(){},
aLO:function aLO(){},
aLP:function aLP(){},
aLQ:function aLQ(){},
aLR:function aLR(){},
aLS:function aLS(){},
aLT:function aLT(){},
aLU:function aLU(){},
aLV:function aLV(){},
aLW:function aLW(){},
aLX:function aLX(){},
aLZ:function aLZ(){},
aM_:function aM_(){},
aM0:function aM0(){},
a7q:function a7q(d){this.a=d}}
C=c[0]
B=c[2]
A=a.updateHolder(c[3],A)
A.Zt.prototype={
i(d,e){var y=this.z.F5(e)
return y==null?this.a.F5(e):y},
gAH(){var y=this.Q
return y===$?this.Q=this:y},
gh_(d){var y=this,x=y.CW
if(x===$){y.gAH()
y.CW!==$&&C.am()
x=y.CW=new A.aJO()}return x},
gta(){var y,x=this,w=x.cx
if(w===$){y=x.gAH()
x.cx!==$&&C.am()
w=x.cx=new A.aJN(y)}return w},
gE3(d){var y=this,x=y.cy
if(x===$){y.gAH()
y.cy!==$&&C.am()
x=y.cy=new A.aJP()}return x},
gun(){return this.z}}
A.aJO.prototype={
ga3N(){return"An error occurred"},
ga3s(){return"Retry"}}
A.aJN.prototype={
ga3I(){return"Today's UI/UX Tip"},
gPF(){return"Streak"},
yN(d,e){var y=A.b8n("en"),x=""+d
return y.a.$3$one$other(e,x+" day streak",x+" days streak")}}
A.aJP.prototype={
gP9(){return"Select Category"},
gPa(){return"Choose a category to challenge"},
gPD(){return"{count} stages"}}
A.a9R.prototype={}
A.a7q.prototype={}
var z=a.updateTypes([])
A.aL6.prototype={
$1(d){return A.bdW(this.a,d)},
$S:79}
A.aL5.prototype={
$2$days$n(d,e){return this.a.gAH().gta().yN(d,e)},
$S:231}
A.aL0.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
if(d===1)return g
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aL1.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLL.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
if(d===1)return g
if(d>=2&&d<=4)return h
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLM.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLN.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
if(d===1)return g
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLY.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM1.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
if(d===1)return g
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM2.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){d.bp(0,10)
d.bp(0,10)
d.bp(0,10)
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM3.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
if(d===1)return g
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM4.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM5.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){var y=B.d.dX(d),x=y===d?0:B.d.j(d).split(".")[1].length
if(d===0)return g
if(y===1)return g
if(y!==0&&B.e.bp(y,1e6)===0&&x===0)return h
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM6.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM7.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){var y=B.d.dX(d),x=y===d?0:B.d.j(d).split(".")[1].length
if(d===0)return h
if(y===1&&x===0)return g
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLO.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLP.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLQ.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLR.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){var y,x,w,v=B.d.dX(d)
if((v===d?0:B.d.j(d).split(".")[1].length)===0){if(v===0)return h
if(v===1)return g
y=B.e.bp(v,10)
x=B.e.bp(v,100)
w=!1
if(y>1)if(y<5)w=x<12||x>14
if(w)return h
w=!0
if(y>=2)if(y<=4)w=x>11&&x<15
if(w)return h}return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLS.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLT.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){var y,x
if(d===0)return h
y=B.d.bp(d,10)
x=B.d.bp(d,100)
if(y===1&&x!==11)return g
if(B.d.dk(y,2,4)===y&&B.d.dk(x,12,14)!==x)return h
if(y===0||B.d.dk(y,5,9)===y||B.d.dk(x,11,14)===x)return h
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLU.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLV.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
if(d===1||d===-1)return g
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLW.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){d.bp(0,10)
d.bp(0,10)
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLX.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){var y,x
if(d===0)return h
y=B.d.bp(d,10)
x=B.d.bp(d,100)
if(y===1&&x!==11)return g
if(B.d.dk(y,2,4)===y&&B.d.dk(x,12,14)!==x)return h
if(y===0||B.d.dk(y,5,9)===y||B.d.dk(x,11,14)===x)return h
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aLZ.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM_.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){if(d===0)return h
return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7}
A.aM0.prototype={
$7$few$many$one$other$two$zero(d,e,f,g,h,i,j){return h},
$1(d){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,y,y,y,y)},
$3$one$other(d,e,f){var y=null
return this.$7$few$many$one$other$two$zero(d,y,y,e,f,y,y)},
$S:7};(function inheritance(){var y=a.mixin,x=a.inherit,w=a.inheritMany
x(A.a9R,C.iY)
x(A.Zt,A.a9R)
x(A.aJO,C.Zu)
x(A.aJN,C.Zs)
x(A.aJP,C.Zv)
w(C.mm,[A.aL6,A.aL5,A.aL0,A.aL1,A.aLL,A.aLM,A.aLN,A.aLY,A.aM1,A.aM2,A.aM3,A.aM4,A.aM5,A.aM6,A.aM7,A.aLO,A.aLP,A.aLQ,A.aLR,A.aLS,A.aLT,A.aLU,A.aLV,A.aLW,A.aLX,A.aLZ,A.aM_,A.aM0])
x(A.a7q,C.o)
y(A.a9R,C.j8)})()
C.aYH(b.typeUniverse,JSON.parse('{"Zt":{"iY":[],"j8":["io","iY"]}}'));(function lazyInitializers(){var y=a.lazyFinal
y($,"bmt","b1S",()=>A.jJ(new A.aL0(),new A.aL1()))
y($,"bnl","b2u",()=>C.aK(["cs",A.jJ(new A.aLL(),new A.aLM()),"de",A.jJ(new A.aLN(),new A.aLY()),"en",A.jJ(new A.aM1(),new A.aM2()),"es",A.jJ(new A.aM3(),new A.aM4()),"fr",A.jJ(new A.aM5(),new A.aM6()),"it",A.jJ(new A.aM7(),new A.aLO()),"ja",A.jJ(new A.aLP(),new A.aLQ()),"pl",A.jJ(new A.aLR(),new A.aLS()),"ru",A.jJ(new A.aLT(),new A.aLU()),"sv",A.jJ(new A.aLV(),new A.aLW()),"uk",A.jJ(new A.aLX(),new A.aLZ()),"vi",A.jJ(new A.aM_(),new A.aM0())],C.ah("k"),C.ah("a7q")))})()};
(a=>{a["bQq1qqV4J1uAYL2Skc2uMAAVmEk="]=a.current})($__dart_deferred_initializers__);