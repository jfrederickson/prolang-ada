-- Authors: Jonathan Frederickson, Dakota Pollitt, Alex Ciaramella

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Strings.Fixed, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Strings.Fixed, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Text_IO;

procedure homework is
  
--   package Str renames Ada.Strings.Unbounded;
  package ITO renames Ada.Integer_Text_IO;
  package SF renames Ada.Strings.Fixed;
  package UTO renames Ada.Strings.Unbounded.Text_IO;
  package SU renames Ada.Strings.Unbounded;
  
  Temp: Unbounded_String;
  outerLine: String(1..15) := (others => ' ');
  curDish: Integer := 0;
  Alice, Bob, Cheryl, Diane, Edgar, expectedDishes:	Integer := 0;
  
  -- Increment counters for each person
  procedure checkLine(Input: String) is
    Line: String := Input;
    Value, Last: Integer := 0;
    
    begin
      get(Line, Value, Last);
      SF.Replace_Slice(Line, 1, Last, " "); -- Remove the first number in the line (dish ID)
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
      
    end; --checkLine
    
    -- Convert an Unbounded_String to a 15-character String. We need this because
    -- we don't know the length of the dish ID - could be 1, 2, or 3
    function toFixedString(str: SU.Unbounded_String) return String is
    
    Temp: String := SU.To_String(str);
    Result: String(1..15);
    
    begin
    SF.Move(source => Temp, Target => Result, Drop => Ada.Strings.Right, Justify => Ada.Strings.Left, Pad => ' ');
    return Result;
    end; -- toFixedString
  
begin
     
  get(expectedDishes);
--   put(expectedDishes);
  Skip_Line;
  put("Result: ");

  loop
    exit when curDish >= expectedDishes;
    outerLine := (others => ' ');
    
    UTO.Get_Line(Temp); -- Get next line as an Unbounded_String
    outerLine := toFixedString(Temp); -- ...and convert it to a String we can work with
    
    checkLine(outerLine);
    outerLine := (1..15 => ' '); -- Clear the String so weird things don't happen
    curDish := curDish + 1;
  end loop;
  
  if alice >= 3 and bob >= 3 and Cheryl >= 3 and diane >= 3 and edgar >= 3 then
    put_line("Satisfactory Meal");
  else
    put_line("Unsatisfactory Meal");
  end if;
     
end homework;
