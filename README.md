# RC4

This is an R implementation of the Rivest-Cipher 4 (RC4). RC4 is a stream cipher, which means the cipher generates an output stream of pseudo-random bits, which is then XORed onto the plaintext to create the ciphertext. The algorithm consists of 2 steps:
1. Key-scheduling algorithm:
   In this step the key is used to permute an array "s" of 256 numbers.
2. Pseudo-random generation
   In this step the array "s" is used to create a stream of pseudorandom bits. These bits can then be XORed onto the plaintext to create the ciphertext.

To show the functionality of the algorithm both the plaintext and the ciphertext are displayed at the end. Eg:  

**Key**: "RC4-stream-cipher"  
**Plaintext**: "This is a random string: 12§$²³/*äö"  
**Ciphertext**: "Ã¯Â¡,Ã’\022\030wÃƒ\022ÃšÂ§j`Â·CÃ†!ÃƒX[9Ã¹Ã†Ã‹Ã”\tWMÃº\u009b)Â£\u0085Ã´".
