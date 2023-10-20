# Assignment of both key and plaintext
s <- c(0:255)
key <- "kbusdb jlg549gg"
plaintext <- "This is a random string: 1234"
key_num <- utf8ToInt(key)
keylength <- nchar(key)

# Key-scheduling algorithm
j <- 0
for (i in 0:255) {
  j <- (j + s[i+1] + key_num[(i%%keylength)+1]) %% 256
  s[c(i+1, j+1)] <- s[c(j+1, i+1)]
}

# Pseudo-random generation algorithm
i <- 0
j <- 0
k <- 0
output <- NULL
while (k < nchar(plaintext)) {
  i <- (i+1)%%256
  j <- (j+s[i+1])%%256
  s[c(i+1, j+1)] <- s[c(j+1, i+1)]
  t <- (s[i+1]+s[j+1])%%256
  output[k+1] <- s[t+1]
  k <- k+1
}

ciphertext <- c()
# Creating the ciphertext by xoring the output bits with the plaintext
for (i in 1:length(output)) {
  encrypted_text <- xor(intToBits(output[i]), intToBits(utf8ToInt(substring(plaintext, i, i))))
  ciphertext[i] <- packBits(encrypted_text, "integer")
}

new_plaintext <- c()
# Recovering the plaintext by xoring with the output stream again
for (i in 1:length(output)) {
  unencrypted_text <- xor(intToBits(output[i]), intToBits(ciphertext[i]))
  new_plaintext[i] <- packBits(unencrypted_text, "integer")
}
paste0("Ciphertext: ", intToUtf8(ciphertext))
paste0("Recovered plaintext: ", intToUtf8(new_plaintext))