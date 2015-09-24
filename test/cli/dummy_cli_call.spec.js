var SoneaCLICall = global.SoneaCLICall;

describe("SoneaCLI Dummy CLI Call", function() {
    it("should respond exit code 0 (for valid argv)", function(done) {
        SoneaCLICall(['', '', '-v'], function(code) {
            code.should.be.eql(0);
            done();
        });
    });
    it("should respond exit code 1 (for invalid argv)", function(done) {
        SoneaCLICall(['', '', 'notExistingCommand'], function(code) {
           code.should.be.eql(1);
           done();
       });
    });
});