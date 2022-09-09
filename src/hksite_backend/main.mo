import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {

  func quicksortsub( arr :  [var Int], low : Nat, high : Nat ) : () {
    if ( low < high ) {
      let pi = partition(arr, low, high);
      if (pi > 1) {
        quicksortsub(arr, low, (pi - 1));
      };
      quicksortsub(arr, (pi + 1), high);
    };
  };

  func swap( arr :  [var Int], i : Nat, j : Nat ) : () {
    let t = arr[j];
    arr[j] := arr[i];
    arr[i] := t; 
  };

  func partition( arr :  [var Int], low : Nat, high : Nat ) : Nat {
  
    let pivot = arr[low];
    var i = low ;
    var j = low + 1;
    while (j <= high ) {
      if ( arr[j] < pivot ) {
          i := i + 1;
          swap(arr, i, j);
      };
      j := j + 1;
    };

    swap(arr, low, i); 

    return i;
  }; 


  func quicksort( arr :  [var Int] ) : () {

    //sort when there are at least 2 elements
    if (arr.size() > 1) {
      quicksortsub(arr, 0, arr.size() - 1);
    };
  };

  public func qsort(arr: [Int] ) : async [Int] {

    // Transform an immutable array into a mutable array.
    let res : [var Int] = Array.thaw(arr);

    quicksort(res);

    // Transform mutable array into immutable array
    Array.freeze<Int>(res)
 
  };

  // public func greet(name : Text) : async Text {
  //  "Hello, " # name # "!"
  //};
};
