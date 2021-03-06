(module
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$i (func (result i32)))
 (memory $0 0)
 (table $0 4 funcref)
 (elem (i32.const 0) $null $~lib/collector/itcm/__gc_mark $std/gc-object/Base~gc $std/gc-object/Custom~gc)
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/state (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/white (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/fromSpace (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/toSpace (mut i32) (i32.const 0))
 (global $~lib/collector/itcm/iter (mut i32) (i32.const 0))
 (global $~lib/argc (mut i32) (i32.const 0))
 (global $std/gc-object/obj (mut i32) (i32.const 0))
 (global $~lib/started (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "main" (func $std/gc-object/main))
 (func $~lib/allocator/arena/__memory_allocate (; 0 ;) (type $FUNCSIG$ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741824
  i32.gt_u
  if
   unreachable
  end
  global.get $~lib/allocator/arena/offset
  local.tee $1
  local.get $0
  i32.const 1
  local.get $0
  i32.const 1
  i32.gt_u
  select
  i32.add
  i32.const 7
  i32.add
  i32.const -8
  i32.and
  local.tee $2
  current_memory
  local.tee $3
  i32.const 16
  i32.shl
  i32.gt_u
  if
   local.get $3
   local.get $2
   local.get $1
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $0
   local.get $3
   local.get $0
   i32.gt_s
   select
   grow_memory
   i32.const 0
   i32.lt_s
   if
    local.get $0
    grow_memory
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $2
  global.set $~lib/allocator/arena/offset
  local.get $1
 )
 (func $~lib/collector/itcm/ManagedObjectList#push (; 1 ;) (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $1
  local.get $1
  i32.load
  i32.const 3
  i32.and
  local.get $0
  i32.or
  i32.store
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $2
  i32.load
  i32.const 3
  i32.and
  local.get $1
  i32.or
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/collector/itcm/ManagedObject#makeGray (; 2 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/collector/itcm/iter
  local.get $0
  i32.eq
  if
   local.get $0
   i32.load offset=4
   global.set $~lib/collector/itcm/iter
  end
  local.get $0
  i32.load
  i32.const -4
  i32.and
  local.tee $2
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=4
  local.get $1
  local.get $1
  i32.load
  i32.const 3
  i32.and
  local.get $2
  i32.or
  i32.store
  global.get $~lib/collector/itcm/toSpace
  local.get $0
  call $~lib/collector/itcm/ManagedObjectList#push
  local.get $0
  local.get $0
  i32.load
  i32.const -4
  i32.and
  i32.const 2
  i32.or
  i32.store
 )
 (func $~lib/collector/itcm/__gc_mark (; 3 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  local.get $0
  if
   global.get $~lib/collector/itcm/white
   local.get $0
   i32.const 16
   i32.sub
   local.tee $1
   i32.load
   i32.const 3
   i32.and
   i32.eq
   if
    local.get $1
    call $~lib/collector/itcm/ManagedObject#makeGray
   end
  end
 )
 (func $~lib/collector/itcm/step (; 4 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
   block $case3|0
    block $case2|0
     block $case1|0
      global.get $~lib/collector/itcm/state
      local.tee $0
      if
       local.get $0
       i32.const 1
       i32.sub
       br_table $case1|0 $case2|0 $case3|0 $break|0
      end
      i32.const 16
      call $~lib/allocator/arena/__memory_allocate
      global.set $~lib/collector/itcm/fromSpace
      global.get $~lib/collector/itcm/fromSpace
      local.tee $0
      i32.const -1
      i32.store offset=8
      local.get $0
      local.get $0
      i32.store
      local.get $0
      local.get $0
      i32.store offset=4
      i32.const 16
      call $~lib/allocator/arena/__memory_allocate
      global.set $~lib/collector/itcm/toSpace
      global.get $~lib/collector/itcm/toSpace
      local.tee $0
      i32.const -1
      i32.store offset=8
      local.get $0
      local.get $0
      i32.store
      local.get $0
      local.get $0
      i32.store offset=4
      global.get $~lib/collector/itcm/toSpace
      global.set $~lib/collector/itcm/iter
      i32.const 1
      global.set $~lib/collector/itcm/state
     end
     global.get $std/gc-object/obj
     i32.const 1
     call_indirect (type $FUNCSIG$vi)
     i32.const 2
     global.set $~lib/collector/itcm/state
     br $break|0
    end
    global.get $~lib/collector/itcm/iter
    i32.load
    i32.const -4
    i32.and
    local.tee $0
    global.get $~lib/collector/itcm/toSpace
    i32.ne
    if
     local.get $0
     global.set $~lib/collector/itcm/iter
     local.get $0
     global.get $~lib/collector/itcm/white
     i32.eqz
     local.get $0
     i32.load
     i32.const -4
     i32.and
     i32.or
     i32.store
     i32.const 1
     global.set $~lib/argc
     local.get $0
     i32.const 16
     i32.add
     local.get $0
     i32.load offset=8
     call_indirect (type $FUNCSIG$vi)
    else     
     global.get $std/gc-object/obj
     i32.const 1
     call_indirect (type $FUNCSIG$vi)
     global.get $~lib/collector/itcm/toSpace
     global.get $~lib/collector/itcm/iter
     i32.load
     i32.const -4
     i32.and
     i32.eq
     if
      global.get $~lib/collector/itcm/fromSpace
      local.set $0
      global.get $~lib/collector/itcm/toSpace
      global.set $~lib/collector/itcm/fromSpace
      local.get $0
      global.set $~lib/collector/itcm/toSpace
      global.get $~lib/collector/itcm/white
      i32.eqz
      global.set $~lib/collector/itcm/white
      local.get $0
      i32.load
      i32.const -4
      i32.and
      global.set $~lib/collector/itcm/iter
      i32.const 3
      global.set $~lib/collector/itcm/state
     end
    end
    br $break|0
   end
   global.get $~lib/collector/itcm/iter
   local.tee $0
   global.get $~lib/collector/itcm/toSpace
   i32.ne
   if
    local.get $0
    i32.load
    i32.const -4
    i32.and
    global.set $~lib/collector/itcm/iter
   else    
    global.get $~lib/collector/itcm/toSpace
    local.tee $0
    local.get $0
    i32.store
    local.get $0
    local.get $0
    i32.store offset=4
    i32.const 1
    global.set $~lib/collector/itcm/state
   end
  end
 )
 (func $~lib/collector/itcm/__gc_allocate (; 5 ;) (type $FUNCSIG$iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741808
  i32.gt_u
  if
   unreachable
  end
  call $~lib/collector/itcm/step
  local.get $0
  i32.const 16
  i32.add
  call $~lib/allocator/arena/__memory_allocate
  local.tee $2
  local.get $1
  i32.store offset=8
  local.get $2
  global.get $~lib/collector/itcm/white
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.or
  i32.store
  global.get $~lib/collector/itcm/fromSpace
  local.get $2
  call $~lib/collector/itcm/ManagedObjectList#push
  local.get $2
  i32.const 16
  i32.add
 )
 (func $std/gc-object/Base~gc (; 6 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  call $~lib/collector/itcm/__gc_mark
 )
 (func $std/gc-object/Custom~gc (; 7 ;) (type $FUNCSIG$vi) (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 2
  call_indirect (type $FUNCSIG$vi)
  local.get $0
  i32.load
  call $~lib/collector/itcm/__gc_mark
  local.get $0
  i32.load offset=4
  call $~lib/collector/itcm/__gc_mark
 )
 (func $std/gc-object/Custom#constructor (; 8 ;) (type $FUNCSIG$i) (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 3
  call $~lib/collector/itcm/__gc_allocate
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 2
   call $~lib/collector/itcm/__gc_allocate
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
 )
 (func $~lib/collector/itcm/__gc_collect (; 9 ;) (type $FUNCSIG$v)
  (local $0 i32)
  block $break|0
   block $case1|0
    global.get $~lib/collector/itcm/state
    local.tee $0
    i32.eqz
    br_if $case1|0
    local.get $0
    i32.const 1
    i32.eq
    br_if $case1|0
    br $break|0
   end
   call $~lib/collector/itcm/step
  end
  loop $continue|1
   global.get $~lib/collector/itcm/state
   i32.const 1
   i32.ne
   if
    call $~lib/collector/itcm/step
    br $continue|1
   end
  end
 )
 (func $start:std/gc-object (; 10 ;) (type $FUNCSIG$v)
  (local $0 i32)
  i32.const 8
  global.set $~lib/allocator/arena/startOffset
  global.get $~lib/allocator/arena/startOffset
  global.set $~lib/allocator/arena/offset
  call $std/gc-object/Custom#constructor
  global.set $std/gc-object/obj
  call $~lib/collector/itcm/__gc_collect
  global.get $std/gc-object/obj
  local.tee $0
  local.get $0
  i32.store
  call $~lib/collector/itcm/__gc_collect
  i32.const 0
  global.set $std/gc-object/obj
  call $~lib/collector/itcm/__gc_collect
 )
 (func $std/gc-object/main (; 11 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  i32.eqz
  if
   call $start:std/gc-object
   i32.const 1
   global.set $~lib/started
  end
 )
 (func $null (; 12 ;) (type $FUNCSIG$v)
  nop
 )
)
