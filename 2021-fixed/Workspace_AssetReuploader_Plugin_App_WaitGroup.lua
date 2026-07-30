-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x2
-- no manual fixes needed; paste as-is.
-- ============================================================
--!strict
local WaitGroup = {}

local function Add(self: WaitGroup, f: (any) -> ())
    self._threads = self._threads + (1); --[[ 2021: was compound assignment ]]
    task.spawn(function()
        f()
        self._threads = self._threads - (1); --[[ 2021: was compound assignment ]]

        local waitThread = self._waitThread
        if self._threads == 0 and waitThread then
            self._waitThread = nil
            coroutine.resume(waitThread)
        end
    end)
end

local function Wait(self: WaitGroup)
    if self._threads == 0 then return end
    assert(not self._waitThread, "WaitGroup:Wait() already in progress")

    self._waitThread = coroutine.running()
    coroutine.yield()
end

type WaitGroup = {
    _threads: number,
    _waitThread: thread?,

    Add: typeof(Add),
    Wait: typeof(Wait),
}

function WaitGroup.new(): WaitGroup
    return {
        _threads = 0,

        Add=Add,
        Wait=Wait
    }
end

return WaitGroup