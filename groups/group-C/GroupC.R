NoramalApprox<-function(z){
  phi<-rep(0,21)
  r2p<-1/sqrt(2*pi)
  
  phi[1]<-0.5*(1+sqrt(1-exp(-2*z*z/pi)))
  
  phi[2]<-1-r2p*exp(-z*z/2)/(z+0.8*exp(-0.4*z))
  
  k=sqrt(2/pi)
  phi[3]<-exp(2*k*z)/(1+exp(2*k*z))
  
  t<-1/(1+0.33267*z)
  a1<-0.4361836
  a2<-0.1201676
  a3<-0.937298
  phi[4]<-1-(a1*t-a2*t*t+a3*t*t*t)*exp(-z*z/2)*r2p
  
  a<-(1+sqrt(1-2*pi*pi+6*pi))/(2*pi)
  b<-2*pi*a*a
  A<-sqrt(1+b*z*z)/(1+a*z*z)
  P0<-sqrt(pi/2)
  phi[5]<-1-r2p*exp(-z*z/2)*(1-A/(P0*z+sqrt(P0*P0*z*z+exp(-z*z/2)*A)))/z
  
  y<-sqrt(2/pi)*z*((1+0.044715*z*z))
  phi[6]<-0.5*(1+tanh(y))
  
  y<-0.806*z*1-0.018*z
  phi[7]<-1-0.5*(1-sqrt(1-exp(-y*y)))
  
  phi[8]<-1-0.5*(exp(-0.717*z-0.416*z*z))
  
  if(z>2.7){
    phi[9]<-1-r2p*exp(-z*z/2)/z
  }else{
    phi[9]<-1-0.5*exp(-(z*z+1.2*z^0.8)/2)
  }
  
  y<-4.2*pi*(z/(9-z))
  phi[10]<-1-1/(1+exp(y))
  
  phi[11]<-1/(1+exp(-sqrt(pi)*(0.9*z+0.0418198*z*z*z-0.0004406*z*z*z*z*z)))
  
  top<-(4-pi)*z+sqrt(2*pi)*(pi-2)
  bottom<-(4-pi)*z*z*sqrt(2*pi)+2*sqrt(2*pi)*(pi-2)+2*pi*z
  phi[12]<-1-exp(-z*z/2)*top/bottom
  
  a1<-5.575192695
  a2<-12.77436324
  b1<-14.38718147
  b2<-31.53531977
  top<-z*z+a1*z+a2
  bottom<-z*z*z*sqrt(2*pi)+b1*z*z+b2*z+2*a2
  phi[13]<-1-exp(-z*z/2)*top/bottom
  
  phi[14]<-0.5+0.5*sqrt(1-exp(-z*z*sqrt(pi/8)))
  
  top<-(-z*z/2)*(4/pi+0.147*z*z/2)
  bottom<-1+0.147*z*z/2
  
  phi[15]<-0.5*(1+sqrt(1-exp(top/bottom)))
  
  H1<-tanh(-0.2695*z)
  H2<-tanh(0.5416*z)
  H3<-tanh(0.4134*z)
  
  if(z<3.36){
      phi[16]<-0.5-1.136*H1+2.47*H2-3.013*H3
  }else{
    phi[16]<-1
  }
  
  H11<-tanh(1.280022196-0.720528073*z)
  H12<-tanh(0.033142223-0.682842425*z)
  
  if(z>3.6){
    phi[17]<-1
  }else{
    phi[17]<-(0.46375418+0.065687194*H11-0.602383931*H12)
  }
  
  top<-exp(-z*z/2)
  bottom<-0.226+0.64*z+0.33*sqrt(z*z+3)
  phi[18]<-1-r2p*top/bottom
  
  H1<-tanh(0.043+0.2624*z)
  H2<-tanh(-1.687-0.519*z)
  H3<-tanh(-1.654+0.5044*z)
  y<-0.125+3.611*H1-4.658*H2+4.982*H3
  
  phi[19]<-1/(1+exp(-y))
  
  w<-0.268
  phi[20]<-w*phi[5]+(1-w)*phi[13]
  
  top<-exp(-z*z/2)
  bottom<-(44/79+8/5*z+5/6*sqrt(z*z+3))
  phi[21]<-1-top/bottom
  
  phi
}

X<-seq(0.001,5,0.001)
Results<-matrix(rep(0,21*length(X)),nrow=length(X),ncol=21)

for (i in 1:length(X)){
    Results[i,]<-NoramalApprox(X[i])
}

for (i in 1:21){
  plot(Results[,i], main=i)
}

Compare<-pnorm(X)
Error<-matrix(rep(0,21*length(X)),nrow=length(X),ncol=21)
AbsError<-matrix(rep(0,21*length(X)),nrow=length(X),ncol=21)

for (i in 1:21){
  Error[,i]<-Results[,i] - Compare
  AbsError[,i]<-abs(Results[,i] - Compare)
}

boxplot(Error, main="Error",
        xlab="Approximiation", ylab="Error") 

{
plot(Error[,20],lty=,x=X,ylim = c(-6*10^{-5},2*10^{-5}),col="pink",cex=0.2,ylab="Error")
points(Error[,5],lty=2,x=X,col="blue",cex=0.2)
points(Error[,13],lty=3,x=X,cex=0.2)
legend(4,-4*10^{-5},legend = c("F5","F13","F20"),col = c("blue","black","pink"),pch=18)
}
