import List "mo:base/List";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor Dkeeper {
  public type Note = {
    title : Text;
    content : Text;
  };
  stable var notes : List.List<Note> = List.nil<Note>();

  public func createNote(tileText : Text, contentText : Text) {
    let newNote : Note = {
      title = tileText;
      content = contentText;
    };
    notes := List.push(newNote, notes);
    Debug.print(debug_show (notes));
  };
  public query func readNotes() : async [Note] {
    return List.toArray(notes);
  };
  public func removeNotes(id : Nat) {
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id +1);
    notes := List.append(listFront, listBack);
  };
};
