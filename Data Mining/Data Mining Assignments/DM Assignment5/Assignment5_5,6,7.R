x = c(1,2,2.5,3,3.5,4,4.5,5,7,8,8.5,9,9.5,10)

c1 = 1
c2 = 2

for(i in 2:10) {
  
  first_cluster = x[abs(x-c1[i-1] <= abs(x-c2[i-1]))]
  second_cluster = x[abs(x-c2[i-1]) > abs(x-c2[i-1])]
  
  c1[i] = mean(first_cluster)
  c2[i] = mean(second_cluster)
}

print(first_cluster)
print(second_cluster)

kmeans(x,2)