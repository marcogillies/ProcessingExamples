
// This will store the images we load from file
PImage [][] images;

void setup()
{
  size(170, 100);
  // this loads the folder "images" from 
  // inside your data folder (that is what
  // "dataPath" does).
  File file = new File(dataPath("images"));
  println(file);
  // an array of file names within that folder
  String [] files = file.list();
  
// this part removes any files that are not 
  // png files (you can change it so it works with
  // jpg or other files formats instead)
  // we loop through the array backwards 
  // (because we will be removing elements)
  for(int i = files.length-1; i >= 0; i--)
  {
     // find the extension of the file.
     // this is the final 4 characters of the filename
     // so we have to get the substring that goes from 
     // 4 charcters before the end to the end
     String extension = files[i].substring(files[i].length()-4, files[i].length());
     // check if the extension is ".png"
     if(!(extension.equals(".png")))
     {
       // remove the elment. 
       // we do this by getting the array of all elements before
       // the current element and the array of all elements
       // after the current one and then putting them together. 
       // (first we have to check if the current element is the last element
       // if so we do something a bit different)
       if(i+1 < files.length)
       {
         // get the parts before and after the current element
         // using the subset command (look if up if you don't 
         // understand this code)
         String [] firstPart = subset(files, 0, i);
         String [] secondPart = subset(files, i+1, files.length-i-1);
         // put these together using the concat command
         files = concat(firstPart, secondPart);
       } 
       else 
       {
         // if the current element is the last 
         // element we can just use the subset of
         // elements before the current element. 
         files = subset(files, 0, i);
       }
       
     } 
  }
  
  // create an array the same size as the 
  // array of files
  images = new PImage[files.length/4][4];
  // iterate through the array of files
  for (int i = 0; i < images.length; i++)
  {
    for (int j = 0; j < images[i].length; j++)
    {
      int fileIndex = 4*i+j;
      if(fileIndex < files.length)
        images[i][j] = loadImage("images/"+files[fileIndex]);
    }
  }
}

void draw()
{
  // iterate through all the images
  // you need a nested loop to iterate 
  // over a 2D array
  for(int i = 0; i < images.length; i++)
  {
    for(int j = 0; j < images[i].length; j++)
    {
      // draw the image 
      // multiply i and j by 40 to space them out
      image(images[i][j], j*40, i*40);
    }
  }
}
