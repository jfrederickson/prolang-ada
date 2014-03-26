with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Strings.Fixed;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Strings.Fixed;

procedure homework is
  
--   package Str renames Ada.Strings.Unbounded;
  package ITO renames Ada.Integer_Text_IO;
  package SF renames Ada.Strings.Fixed;
  
  Line: String(1..15) := (others => ' ');
  Last: Integer;
  Alice, Bob, Cheryl, Diane, Edgar, curDish, expectedDishes:	Integer := 0;
  
  procedure checkLine(Input: String) is
    Line: String := Input;
    Value, Last: Integer := 0;
    
    begin
      get(Line, Value, Last);
      SF.Replace_Slice(Line, 1, Last, " ");
      get(Line, Value, Last);
      if Value = 0 then
	Alice := Alice + 1;
      end if;
      SF.Replace_Slice(Line, 1, Last, " ");
      get(Line, Value, Last);
      if Value = 0 then
	Bob := Bob + 1;
      end if;
      SF.Replace_Slice(Line, 1, Last, " ");
      get(Line, Value, Last);
      if Value = 1 then
	Cheryl := Cheryl + 1;
      end if;
      SF.Replace_Slice(Line, 1, Last, " ");
      get(Line, Value, Last);
      if Value = 0 then
	Diane := Diane + 1;
      end if;
      SF.Replace_Slice(Line, 1, Last, " ");
      get(Line, Value, Last);
      if Value = 0 then
	Edgar := Edgar + 1;
      end if;
      
      put(Alice);
      put(Bob);
    end;
  
begin
     
  get(expectedDishes);
--   loop
--     exit when curDish >= expectedDishes;
--     Get_Line(Line, Last);
--     checkLine(Line);
--     Line := (1..15 => ' ');
--     curDish := curDish + 1;
--   end loop;
--   
--   if alice >= 3 and bob >= 3 and Cheryl >= 3 and diane >= 3 and edgar >= 3 then
--     put_line("Satisfactory Meal");
--   else
--     put_line("Unsatisfactory Meal");
--   end if;
     
end homework;
