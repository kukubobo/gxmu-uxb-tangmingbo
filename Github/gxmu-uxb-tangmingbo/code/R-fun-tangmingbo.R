a <- data.frame(a1 = c(2, 4, 6),
                a2 = c(3, 5, 8),
                a3 = c(4, 1, 9))
head(a)
?pmin
pmin(a$a1,a$a2,a$a3)
pmin_apply<-function(...){
  apply(..., 1, min)
}
pmin_apply(a)
pmin_for<-function(...){
n<-as.data.frame(t(...))
result<-c()
for (i in n) {
  result<-c(result,min(i))
 }
result
}
pmin_for(a)
install.packages("bench")
bench::mark(base=pmin(a$a1,a$a2,a$a3),
            pmin_apply=pmin_apply(a),
            pmin_for=pmin_for(a)
)
b1<-data.frame(
  name= c("文", "颜", "唐", "黄"),
  score = c(95, 96, 97, 98))
print(b1)
b2<-data.frame(
  name=c("文", "颜"),
  github=c("uuu1016","yanyutong111"))
print(b2)
?merge
b<-merge(b1,b2,by="name")
print(b)
install.packages("dplyr")
c<-inner_join(b1, b2, by = "name")
print(c)
"%merge%"<-function(x, y){
  by <- intersect(names(x), names(y))
  finish<-merge(x, y, by = by)
  print (finish)
}
b1%merge%b2

