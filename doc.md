# StreamScript User Manual
## What is StreamScript?
StreamScript a language that is designed to work on single or multiple stream input integer data direct fed in via direct input and output a single or multiple streams. The language is evaluated from left to right and evaluate from the innermost to the outermost. The manual is divided up into 3 sections: quick start to create a rudimentary program in StreamScript, feature overview to list everything the language has to offer and an appendix with example problems and solutions as well as the syntax.

## Quick Start
In this section, we are going to create a simple program that takes in a single stream and output a stream where every integer is incremented by 1. Example:
   <table>
   	<tbody>
   		<tr>
   			<td>Input</td><td>Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>2</td>
   		</tr>
   		<tr>
            <td>2</td><td>3</td>
        </tr>
        <tr>
            <td>3</td><td>4</td>
        </tr>
        <tr>
            <td>4</td><td>5</td>
        </tr>
        <tr>
            <td>5</td><td>6</td>
        </tr>
   	</tbody>
   </table>

#### 1. Create input file
To get started, first create a input.txt file in the same directory as the interpreter and separate each item with a line break. Your input file should look like this:
```
1
2
3
4
5
```

#### 2. Create the program
In the same directory, create a file named pr.spl and copy and paste the following into the file:
```
forEach {
    function (fVar x) {
        return (f$x + 1)
    }
};
```

What this does is loop through the input stream one at a time. At each iteration, the value(s) at that point is obtained and stored as a variable x. Then for the return statement, the value of the variable x + 1 is returned.

#### 3. Run the program
To run the program, simply run this in the command line:
```
./myinterpreter pr.spl < input.txt
```

## Features Overview
Note that all statements (apart from the function declaration inside forEach and the return statement inside the function declaration) must end in a semi colon. 

Tabs and spaces are not accounted for so the users are free to use however much they wish.

Since StreamScript operates solely on streams, while it is possible to just establish variables, any meaningful program must be created with a forEach loop in order to output a stream or streams based on the input stream.
#### 1. Arithmetic
All basic arithmetic and all combination of them are supported (plus, minus, divide, multiplication and negation). See below for example:
##### Plus
```
1 + 2 = 3
```
##### Minus
```
2 - 1 = 1
```
##### Multiply
```
2 * 1 = 2
```
##### Divide
```
2 / 1 = 2
```
##### Negation
```
-2 = -2
```
##### Complex Arithmetic
```
(2 + 2) * 3 = 12
```

#### 2. Initializing, Updating and Calling Variables
To initialize a variable called helloWorld to zero, simply type:
```
initVar helloWorld = 0; 
```

To update the value of helloWorld to 1, simply type:
```
updateVar helloWorld = 1;
```

To call the variable helloWorld, simply type:
```
$helloWorld
```

The value assignment of the variables can be anything from integer as shown to all supported arithmetic operations, which means the following statements are valid and equivalent to each other:
```
updateVar helloWorld = 25;
updateVar helloWorld = 5 * 5;
updateVar helloWorld = (2 + 3) * (2 + 3);
```

In addition to that, variables can also be set to the value of another variable:
```
initVar test = 5;
updateVar helloWorld = $test + 5;
```

**Note: the name of the variables must start with a letter**

#### 3. forEach Loop
In order to loop through the input stream(s), a forEach loop functionality is provided. This is the format of forEach loop:
 
```
forEach {
    function ([<functionalVarInit>]) {
        [<initVar | updateVar | ifThen | ifElse>]
        return ([<varCall | functionalVarCall | arithmetic>])
    }
};
```

The forEach loop function similar to map in haskell. The user will define a function where the user can freely name the element of each input stream as well as updating variables and making a return statement for a single or multiple values. Anything after the return statement will not be evaluated and will result in program error.

Let's look at an example where there are two input streams and an outside counter that increments by 1 as each element of the input stream is looped over. Each element for the output stream is the sum of the elements of the two input streams plus the counter copied once. Like this:
<table>
   	<tbody>
   		<tr>
   			<td>Input 1</td>
   			<td>Input 2</td>
   			<td>Counter</td>
   			<td>Output</td>
   		</tr>
   		<tr>
   			<td>1</td>
   			<td>2</td>
   			<td>0</td>
   			<td>3 3</td>
   		</tr>
   		<tr>
            <td>2</td>
            <td>5</td>
            <td>1</td>
            <td>8 8</td>
        </tr>
        <tr>
            <td>3</td>
            <td>9</td>
            <td>2</td>
            <td>14 14</td>
        </tr>
        <tr>
            <td>4</td>
            <td>4</td>
            <td>3</td>
            <td>11 11</td>
        </tr>
        <tr>
            <td>5</td>
            <td>7</td>
            <td>4</td>
            <td>16 16</td>
        </tr>
   	</tbody>
</table>

Program:
```
initVar counter = 0;
forEach {
    function (fVar currentElem1, fVar currentElem2) {
        initVar currentCounterVal = $counter;
        updateVar counter = $counter + 1;
        return (
            f$currentElem1 + f$currentElem2 + $currentCounterVal &
            f$currentElem1 + f$currentElem2 + $currentCounterVal
        )
    }
};
```

In this program we first initialize a variable to represent the counter and assign it the value 0 initially. Then inside the loop, we give each element of the input streams at that iteration a custom name, currentElem1 and currentElem2 in this case.

It is completely ok to name the functional variables the same as the regular variables as they are stored in different locations and called differently. 

The order of the input stream dictates the order of the functional variables, meaning that the first functional variable established will be assigned the value of the elements in the first stream and teh second functional variable will be assigned the value of the elements in the second stream.

Once the functional variables are established, we first create a temporary variable to store the current counter value, then increment the counter value by one for the next iteration. Lastly, we return the sum of the current counter value and the two functional variables.

Note that we _**call functional variable with f$ instead of just $**_.

#### 4. Comparisons (Booleans)
Comparisons between different integer values is available as well in the context of if then and if else statements (see the section below):

```
initVar one = 1;
initVar two = 2;
initVar oneCopy = 1;
```

##### Equal To
```
$one == $oneCopy
```

##### Not Equal
```
$one != $two
```

##### Larger Than
```
$two > $one
```

##### Less Than
```
$one < $two
```

##### Larger Than or Equal To
```
$one >= $oneCopy
```

##### Less Than or Equal To
```
$one <= $oneCopy
```

#### 5. If Then and If Else Statement
If else statement is also supported by StreamScript and they come in 2 flavors:

##### If Then
The format of the if then is as follow:
```
if (<Boolean>) {
    [<initVar | updateVar | ifThen | ifElse>]
};
```

Example:
```
initVar valOne = 34;
initVar valTwo = 45;
initVar dependency = 0;

if ($valOne < $valTwo) {
    updateVar dependency = $valOne;
};
```

At the end of the example the value of the variable dependency should be equal to 34, the same value as valOne because valOne is smaller than valTwo

##### If Else
The format of the if else is as follow:
```
if (<Boolean>) {
    [<initVar | updateVar | ifThen | ifElse>]
} else {
    [<initVar | updateVar | ifThen | ifElse>]
}
```

Example:
```
initVar valOne = 34;
initVar valTwo = 45;
initVar dependency = 0;

if ($valOne > $valTwo) {
    updateVar dependency = $valOne;
} else {
    updateVar dependency = $valTwo;
};
```

In this case the value of the variable dependency would be 45, the same as valTwo since the statement of valOne larger than valTwo is not true.

##### Nested If Statement
You can also nest if statements like this:
```
initVar valOne = 34;
initVar valTwo = 45;
initVar dependency = 0;

if ($valOne < $valTwo) {
    if ($valOne < 0) {
        updateVar dependency = $valOne;
    };
};
```

In this case the value of the variable dependency would still be 0 since while valOne < valTwo is true, valOne < 0 isn't.

## Appendix
#### Problems and Solutions
##### 1. Prefixing
###### Problem:
Take a sequence a1 a2 a3 a4 a5 . . . as an input and output the sequence 0 a1 a2 a3 . . ., that is, the sequence that is the same as the input sequence, but starting with a single 0 character.
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>0</td>
   		</tr>
   		<tr>
            <td>2</td><td>1</td>
        </tr>
        <tr>
            <td>3</td><td>2</td>
        </tr>
        <tr>
            <td>4</td><td>3</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
initVar prevVal = 0;
initVar currentVal = 0;

forEach {
    function (fVar x) {
        updateVar currentVal = $prevVal;
        updateVar prevVal = f$x;
        return ($currentVal)
    }
};
```

##### 2. Copying:
###### Problem:
Take a sequence a1 a2 a3 a4 a5 . . . as an input and output two copies of it.
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>-5</td><td>-5 -5</td>
   		</tr>
   		<tr>
            <td>0</td><td>0 0</td>
        </tr>
        <tr>
            <td>3</td><td>3 3</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
forEach {
    function (fVar x) {
        return (f$x & f$x)
    }
};
```

##### 3. Stream Arithmetic
###### Problem:
Take two sequences a1 a2 a3 a4 . . . and b1 b2 b3 b4 . . ., and produce the sequence
    
    a1 + 3b1 a2 + 3b2 a3 + 3b3 a4 + 3b4 . . .
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1 5</td><td>16</td>
   		</tr>
   		<tr>
            <td>2 4</td><td>14</td>
        </tr>
        <tr>
            <td>3 3</td><td>12</td>
        </tr>
        <tr>
            <td>4 2</td><td>10</td>
        </tr>
        <tr>
            <td>5 1</td><td>8</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
forEach {
    function (fVar x, fVar y) {
        return (f$x + 3 * f$y)
    }
};
```

##### 4. Accumulator
###### Problem:
Take a sequence a1 a2 a3 a4 . . . and output the sequence 

    a1 a1+a2 a1+a2+a3 a1+a2+a3+a4 . . .

where each term of the output is the sum of all the input terms up to that point.
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>2</td><td>3</td>
        </tr>
        <tr>
            <td>3</td><td>6</td>
        </tr>
        <tr>
            <td>4</td><td>10</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
initVar acc = 0;
forEach {
    function (fVar x) {
        updateVar acc = $acc + f$x;
        return ($acc)
    }
};
```

##### 5. Fibonacci
Take a sequence a1 a2 a3 a4 a5 . . . and output the sequence

    a1 a1 + a2 2a1 + a2 + a3 3a1 + 2a2 + a3 + a4 5a1 + 3a2 + 2a3 + a4 . . .

where the coefficients of each input term in the sums follows the Fibonacci series 1 1 2 3 5 8 . . . from when it first appears. Recall that the Fibonacci series starts with two 1s and then the subsequent terms are always the sum of the previous two.

<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>0</td><td>1</td>
        </tr>
        <tr>
            <td>0</td><td>2</td>
        </tr>
        <tr>
            <td>0</td><td>3</td>
        </tr>
        <tr>
            <td>0</td><td>5</td>
        </tr>
   	</tbody>
</table>

<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>2</td><td>3</td>
        </tr>
        <tr>
            <td>3</td><td>7</td>
        </tr>
        <tr>
            <td>4</td><td>14</td>
        </tr>
        <tr>
            <td>5</td><td>26</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
initVar oneBefore = 0;
initVar twoBefore = 0;
initVar current = 0;

forEach {
    function (fVar x) {
        updateVar current = f$x + $oneBefore + $twoBefore;
        updateVar twoBefore = $oneBefore;
        updateVar oneBefore = $current;
        return ($current)
    }
};
```

##### 6. Copying + Prefix
###### Problem
Take a sequence a1 a2 a3 a4 a5 . . . as an input and output two copies of it, the second prefixed with 0.
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>-5</td><td>-5 0</td>
   		</tr>
   		<tr>
            <td>0</td><td>0 -5</td>
        </tr>
        <tr>
            <td>3</td><td>3 0</td>
        </tr>
   	</tbody>
</table>

###### Solution
```
initVar prevVal = 0;
initVar currentVal = 0;

forEach {
    function (fVar x) {
        updateVar currentVal = $prevVal;
        updateVar prevVal = f$x;
        return (f$x & $currentVal)
    }
};
```

##### 7. Copying + Stream Arithmetic
###### Problem:
Take two sequences a1 a2 a3 a4 . . . and b1 b2 b3 b4 . . ., and produce two sequences

    a1 − b1 a2 − b2 a3 − b3 a4 − b4 . . .
    a1 a2 a3 a4 . . .
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1 3</td><td>-2 1</td>
   		</tr>
   		<tr>
            <td>2 2</td><td>0 2</td>
        </tr>
        <tr>
            <td>3 1</td><td>2 3</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
forEach {
    function (fVar x, fVar y) {
        return (f$x - f$y & f$x)
    }
};
```

##### 8. Copying + Prefix + Stream Arithmetic
###### Problem:
Take a sequence a1 a2 a3 a4 a5 . . . as an input and output

    a1 + 0 a2 + a1 a3 + a2 a4 + a3 a5 + a4 . . .
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>2</td><td>3</td>
        </tr>
        <tr>
            <td>3</td><td>5</td>
        </tr>
        <tr>
            <td>4</td><td>7</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
initVar prevVal = 0;
initVar currentVal = 0;

forEach {
    function (fVar x) {
        updateVar currentVal = $prevVal;
        updateVar prevVal = f$x;
        return (f$x + $currentVal)
    }
};
```

##### 9. Natural Number
Take a sequence a1 a2 a3 a4 a5 . . . as an input and output
    
    a1 2a1 + a2 3a1 + 2a2 + a3 4a1 + 3a2 + 2a3 + a4 5a1 + 4a2 + 3a3 + 2a4 + a5 . . .

<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>0</td><td>2</td>
        </tr>
        <tr>
            <td>0</td><td>3</td>
        </tr>
        <tr>
            <td>0</td><td>4</td>
        </tr>
        <tr>
            <td>0</td><td>5</td>
        </tr>
   	</tbody>
</table>

<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>2</td><td>4</td>
        </tr>
        <tr>
            <td>3</td><td>10</td>
        </tr>
        <tr>
            <td>4</td><td>20</td>
        </tr>
        <tr>
            <td>5</td><td>35</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
initVar counter = 0;
initVar acc = 0;

forEach {
    function (fVar x) {
        updateVar counter = $counter + f$x;
        updateVar acc = $acc + $counter;
        return ($acc)
    }
};
```

##### 10. Delayed Feedback
###### Problem:
Take a sequence a1 a2 a3 a4 a5 a6 . . . as an input and output

    a1 a2 a3 + a1 a4 + a2 a5 + a3 + a1 a6 + a4 + a2 . . .

that is, the first two outputs are the same as the first two inputs. Then, to produce the output at time n > 2, the current input an is added to the value which was previously output at time n − 2.
<table>
   	<tbody>
   		<tr>
   			<td>Example Input</td><td>Example Output</td>
   		</tr>
   		<tr>
   			<td>1</td><td>1</td>
   		</tr>
   		<tr>
            <td>2</td><td>2</td>
        </tr>
        <tr>
            <td>3</td><td>4</td>
        </tr>
        <tr>
            <td>4</td><td>6</td>
        </tr>
        <tr>
            <td>5</td><td>9</td>
        </tr>
   	</tbody>
</table>

###### Solution:
```
initVar prevTwo = 0;
initVar prevOne = 0;
initVar currentVal = 0;

forEach {
    function (fVar x) {
        updateVar prevTwo = $prevOne;
        updateVar prevOne = $currentVal;
        updateVar currentVal = f$x + $prevTwo;
        return ($currentVal)
    }
};
```

#### Syntax
```
Exps ::= <Exp> ; <Exps>
       | <Exp> ;
VarList ::= fVar <string>, <VarList>
          | fVar <string>
VarOpsList ::= <VarOps> & <VarOpsList>
             | <VarOps>
Exp ::= var <string> = <VarOps>
      | (<Exp>)
      | if (<Bools>) { <Exps> }
      | if (<Bools>) { <Exps> } else { <Exps> }
      | updateVar <string> = <VarOps>
      | forEach { <FunctionDT> }
Bools ::= <VarOps> == <VarOps>
        | <VarOps> != <VarOps>
        | <VarOps> > <VarOps>
        | <VarOps> < <VarOps>
        | <VarOps> >= <VarOps>
        | <VarOps> <= <VarOps>
FunctionsDT ::= function (<VarList>) { <Exps> return (<VarOpsList>) }
              | function (<VarList>) { return (<VarOpsList>) }
VarOps ::= f$<string>
         | $<string>
         | <int>
         | <VarOps> + <VarOps>
         | <VarOps> - <VarOps>
         | <VarOps> * <VarOps>
         | <VarOps> / <VarOps>
         | - <VarOps>
int ::= [0-9]
alpha ::= [a-zA-Z]
string ::= <alpha> [<alpha> <int> \_ \']*
```
