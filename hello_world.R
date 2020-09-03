print("hello world!")

# inspect package versions
print((as.data.frame(installed.packages())[,c("Package", "Version")]))
